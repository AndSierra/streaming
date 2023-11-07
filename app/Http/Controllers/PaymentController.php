<?php
namespace App\Http\Controllers;

use App\Models\Payment;
use Illuminate\Http\Request;
use Omnipay\Omnipay;

use App\Models\Qrcode;
use App\Models\Transaction;
use Illuminate\Support\Facades\Auth;

class PaymentController extends Controller
{
    private $gateway;
    public function __construct()
    {
        $this->gateway = Omnipay::create('PayPal_Rest');
        $this->gateway->setClientId(env('PAYPAL_CLIENT_ID'));
        $this->gateway->setSecret(env('PAYPAL_CLIENT_SECRET'));
        $this->gateway->setTestMode(true);
    }
    public function pay()
    {
        try {
            $urlSegments = explode('/', url()->previous());
            $qrcodeId = end($urlSegments);

            session(['qrcodeId' => $qrcodeId]);

            $qrcode = Qrcode::find($qrcodeId);
            $amount = $qrcode->amount;

            $response = $this->gateway->purchase(
                array(
                    'amount' => $amount,
                    'currency' => env('PAYPAL_CURRENCY'),
                    'returnUrl' => url('success'), 
                    'cancelUrl' => url('error')  
                )
            )->send();

            if ($response->isRedirect()) {
                $response->redirect();
            } else {
                return $response->getMessage();
            }

        } catch (\Throwable $th) {
            return $th->getMessage();
        }
    }
    public function success(Request $request)
    {
        if ($request->input('paymentId') && $request->input('PayerID')) {
            $transaction = $this->gateway->completePurchase(
                array(
                    'payer_id' => $request->input('PayerID'),
                    'transactionReference' => $request->input('paymentId')
                )
            );
            $response = $transaction->send();

            if ($response->isSuccessful()) {
                $arr = $response->getData();

                $payment = new Payment();
                $payment->payment_id = $arr['id'];
                $payment->payer_id = $arr['payer']['payer_info']['payer_id'];
                $payment->payer_email = $arr['payer']['payer_info']['email'];
                $payment->amount = $arr['transactions'][0]['amount']['total'];
                $payment->currency = env('PAYPAL_CURRENCY');
                $payment->payment_status = $arr['state'];
                $payment->save(); // Redirige a la página de transacciones después de guardar los datos

                $newPaymentId = $payment->id;

                $qrcodeId = session('qrcodeId');
                $qrcode = Qrcode::find($qrcodeId);

                $qrcode_ownerid = $qrcode->user_id;
                $product = $qrcode->product_name;
                $amount = $qrcode->amount;

                $transaction = new Transaction([

                    'user_id' => Auth::id(),
                    'qrcode_owner_id' => $qrcode_ownerid,
                    'qrcode_id' => $qrcodeId,
                    'payment_method' => 'Paypal',
                    'paypal_payment_id' => $newPaymentId,
                    'message' => 'El producto comprado es ' . $product,
                    'amount' => $amount,
                    'status' => 'Pago Exitoso'
                ]);

                $transaction->save();
                session()->forget('qrcodeId');

                return redirect()->route('transactions.index');
            } else {
                return $response->getMessage();
            }
        } else {
            return 'Payment declined!!';
        }
    }
    public function error()
    {
        return 'User declined the payment!';
    }
}