<!-- Name Field -->
<div class="col-sm-12">
    {!! Form::label('name', 'Name:') !!}
    <p>{{ $roles->name }}</p>
</div>

<div class="col-sm-12">
    {!! Form::label('create_at', 'Create_at:') !!}
    <p>{{ $roles->created_at }}</p>
</div>


<div class="col-sm-12">
    {!! Form::label('updated_at', 'Updated_at:') !!}
    <p>{{ $roles->updated_at }}</p>
</div>

                <div class="col-sm-1">
                    <h1>{{ $roles->name }}</h1>
                    
                </div>
<div class="col-sm-12">
    <table class="table-responsive-lg">
        <thead class="table-dark">
            <tr>
                <th scope="col ">ID</th>
                <th scope="col">Nombre</th>
                <th scope="col">Email</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($roles->users as $user)
                <tr>
                    <td>{{ $user->id }}</td>
                    <td>{{ $user->name }}</td>
                    <td>{{ $user->email }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>


