@extends('layouts.default')

@section('content')


<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/clientes') }}">Cliente</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="{{ URL::to('clientes/create') }}">Cliente</a>
	</ul>
</nav>

		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">Cliente</header>
				<div class="panel-body">
					{{ Form::open(array('url' => '/clientes/' . $cliente->id, 'class' => 'panel-body wrapper-lg')) }}
					{{ Form::hidden('_method', 'DELETE') }}

						<div class="form-group">
							<label>Cliente</label>
							
							<div class="form-control input-lg">
								{{ $cliente->cliente }}
							</div><br>

						{{ Form::submit('Eliminar', array('class' => 'btn btn-warning')) }}
						{{ Form::close() }}
				</div>
			</section>
		</div>
	</div>

@stop