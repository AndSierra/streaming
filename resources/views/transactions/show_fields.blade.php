<!-- User Id Field -->
<div class="col-sm-12">
    {!! Form::label('user_id', 'User Id:') !!}
    <p>{{ $transaction->user_id }}</p>
</div>

<!-- Qrcode Owner Id Field -->
<div class="col-sm-12">
    {!! Form::label('qrcode_owner_id', 'Qrcode Owner Id:') !!}
    <p>{{ $transaction->qrcode_owner_id }}</p>
</div>

<!-- Qrcode Id Field -->
<div class="col-sm-12">
    {!! Form::label('qrcode_id', 'Qrcode Id:') !!}
    <p>{{ $transaction->qrcode_id }}</p>
</div>

<!-- Payment Method Field -->
<div class="col-sm-12">
    {!! Form::label('payment_method', 'Payment Method:') !!}
    <p>{{ $transaction->payment_method }}</p>
</div>

<!-- Paypal Payment Id Field -->
<div class="col-sm-12">
    {!! Form::label('paypal_payment_id', 'Paypal Payment Id:') !!}
    <p>{{ $transaction->paypal_payment_id }}</p>
</div>

<!-- Message Field -->
<div class="col-sm-12">
    {!! Form::label('message', 'Message:') !!}
    <p>{{ $transaction->message }}</p>
</div>

<!-- Amount Field -->
<div class="col-sm-12">
    {!! Form::label('amount', 'Amount:') !!}
    <p>{{ $transaction->amount }}</p>
</div>

<!-- Status Field -->
<div class="col-sm-12">
    {!! Form::label('status', 'Status:') !!}
    <p>{{ $transaction->status }}</p>
</div>

