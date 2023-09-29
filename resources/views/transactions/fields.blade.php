<!-- User Id Field -->
{!! Form::hidden('user_id', Auth::user()->id, ['class' => 'form-control', 'required']) !!}

<!-- Qrcode Owner Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('qrcode_owner_id', 'Qrcode Owner Id:') !!}
    {!! Form::number('qrcode_owner_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Qrcode Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('qrcode_id', 'Qrcode Id:') !!}
    {!! Form::number('qrcode_id', null, ['class' => 'form-control', 'required']) !!}
</div>

<!-- Payment Method Field -->
<div class="form-group col-sm-6">
    {!! Form::label('payment_method', 'Payment Method:') !!}
    {!! Form::text('payment_method', null, ['class' => 'form-control', 'maxlength' => 255, 'maxlength' => 255]) !!}
</div>

<!-- Message Field -->
<div class="form-group col-sm-12 col-lg-12">
    {!! Form::label('message', 'Message:') !!}
    {!! Form::textarea('message', null, ['class' => 'form-control']) !!}
</div>

<!-- Amount Field -->
<div class="form-group col-sm-6">
    {!! Form::label('amount', 'Amount:') !!}
    {!! Form::number('amount', null, ['class' => 'form-control', 'required']) !!}
</div>

<!-- Status Field -->
<div class="form-group col-sm-6">
    {!! Form::label('status', 'Status:') !!}
    {!! Form::text('status', null, ['class' => 'form-control', 'required', 'maxlength' => 255, 'maxlength' => 255]) !!}
</div>