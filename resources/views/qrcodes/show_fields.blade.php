<!-- User Id Field -->
<div class="col-sm-12" style="margin-bottom: 1%;">
   <H6><strong>PROPIETARIO DEL PRODUCTO</strong></H6>
    <td> <button type="button" class="btn btn-outline-primary">{{ $qrcode->user['name']}}</button></td>
</div>

<!-- Website Field -->
<div class="col-sm-12">
    {!! Form::label('website', 'Website:') !!}
    <p>{{ $qrcode->website }}</p>
</div>

<!-- Company Name Field -->
<div class="col-sm-12">
    {!! Form::label('company_name', 'Company Name:') !!}
    <p>{{ $qrcode->company_name }}</p>
</div>

<!-- Product Name Field -->
<div class="col-sm-12">
    {!! Form::label('product_name', 'Product Name:') !!}
    <p>{{ $qrcode->product_name }}</p>
</div>

<!-- Product Url Field -->
<div class="col-sm-12">
    {!! Form::label('product_url', 'Product Url:') !!}
    <p>{{ $qrcode->product_url }}</p>
</div>

<div class="col-sm-12">
    <h6><strong>Product_url_image_path:</strong></h6>
    <img src="../{{$qrcode->product_url_image_path}}" width="100px" />
</div>
<!-- Callback Url Field -->
<div class="col-sm-12">
    {!! Form::label('callback_url', 'Callback Url:') !!}
    <p>{{ $qrcode->callback_url }}</p>
</div>

<!-- Qrcode Path Field -->
<div class="col-sm-12">
    {!! Form::label('qrcode_path', 'Qrcode Path:') !!}  
    <p> <img src="{{asset($qrcode->qrcode_path)}}" ></p>
</div>

<!-- Amount Field -->
<div class="col-sm-12">
    {!! Form::label('amount', 'Amount:') !!}
    <p>{{ $qrcode->amount }}</p>
</div>

<h1>TRANSACCIONES DE ESTE PRODUCTO</h1>

<div class="col-sm-12">
    <table class="table">
        <thead class="table-dark">
            <tr>
                <th scope="col">Transactions Id</th>
                <th scope="col">Amount</th>
                <th scope="col">payment_method</th>
                <th scope="col">status</th>
                <th scope="col">usuario</th>
            </tr>
        </thead>
        <tbody>
            @php
                $totalAmount = 0;  // Inicializamos la variable para almacenar el total
            @endphp
            @foreach ($qrcode->transactions as $transaction)
                <tr>
                    <td>{{ $transaction->id }}</td>
                    <td>{{ $transaction->amount }}</td>
                    <td>{{ $transaction->payment_method }}</td>
                    <td>{{ $transaction->status }}</td>
                    <td></td>
                </tr>
                @php
                    $totalAmount += $transaction->amount;  // Sumamos el monto de la transacción al total
                @endphp
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <td colspan="2"></td>
                <td>Total: ${{ $totalAmount }}</td>
                <td></td>
                <td></td>
            </tr>
        </tfoot>
    </table>
</div>


