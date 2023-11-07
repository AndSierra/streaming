<!-- Rol Field -->
<div class="col-sm-12">
    {!! Form::label('rol', 'Rol:') !!}
    <p><button type="button" class="btn btn-outline-primary">{{ $user->role_name[0]['name'] }}</button></p>
</div>

<!-- Name Field -->
<div class="col-sm-12">
    {!! Form::label('name', 'Name:') !!}
    <p>{{ $user->name }}</p>
</div>

<!-- Email Field -->
<div class="col-sm-12">
    {!! Form::label('email', 'Email:') !!}
    <p>{{ $user->email }}</p>
</div>

<!-- Token Actual-->
<div class="col-sm-12">
    {!! Form::label('Token', 'Token:') !!}
    <p>{{ $user->remember_token }}</p>
</div>

<!-- Solicitar token -->
<div class="col-sm-12">
    <form method="POST" action="{{ route('generate-token', $user) }}">
        @csrf
        @method('POST')
        <button type='submit' class="btn btn-primary">Generar Token</button>
    </form>
</div>


<h1>TRANSACCIONES DE ESTE USUARIO</h1>

<div class="col-sm-12">
    <table class="table">
        <thead class="table-dark">
            <tr>
                <th scope="col">Transactions Id</th>
                <th scope="col">Producto</th>
                <th scope="col">Precio</th>
                <th scope="col">Metodo de pago</th>
                <th scope="col">Estado</th>
            </tr>
        </thead>
        <tbody>
            @php
                $totalAmount = 0;  // Inicializamos la variable para almacenar el total
            @endphp
            @foreach ($user->transactions as $transaction)
                <tr>
                    <td>{{ $transaction->id }}</td>
                    <td><a href="/qrcodes/{{$transaction->qrcode_id}}">{{ $transaction->product['product_name']}}</a>

                        <img src="../{{ $transaction->product['product_url_image_path']}}" width="100px" />
                </td>
                    <td>{{ $transaction->amount }}</td>
                    <td>{{ $transaction->payment_method }}</td>
                    <td>{{ $transaction->status }}</td>
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


<h1>PRODUCTOS DE ESTE USUARIO</h1>

<div class="col-sm-12">
    <table class="table">
        <thead class="table-dark">
            <tr>
                <th scope="col ">Producto Id</th>
                <th scope="col">Producto</th>
                <th scope="col">Precio</th>
            </tr>
        </thead>
        <tbody>
            @php
            $totalAmount = 0;  // Inicializamos la variable para almacenar el total
            @endphp
            @foreach ($user->qrcodes as $qrcode)
                <tr>
                    <td>{{ $qrcode->id }}</td>
                    <td>
                    <a href="/qrcodes/{{$qrcode->id}}">{{ $qrcode->product_name }}</a>
                        <img src="../{{$qrcode->product_url_image_path}}" width="100px" />
                    </td>
                    <td>{{ $qrcode->amount }}</td>
                </tr>
                @php
                $totalAmount += $qrcode->amount;  // Sumamos el monto de la transacción al total
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