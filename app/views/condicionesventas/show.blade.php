@extends('layouts.default')

@section('content')


<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/condicionesventas') }}">Condiciones de Venta</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="{{ URL::to('/condicionesventas/create') }}">Crear nuevo Condicion de Venta</a>
	</ul>
</nav>

		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">Condiciones de Venta</header>
				<div class="panel-body">
					{{ Form::open(array('url' => '/condicionesventas/' . $condicionesventa->id, 'class' => 'panel-body wrapper-lg')) }}
					{{ Form::hidden('_method', 'DELETE') }}

						<div class="form-group">
							<label>Condicion de Venta</label>
							
							<div class="form-control input-lg">
								{{ $condicionesventa->condicionesventa }}
							</div><br>
 
						{{ Form::submit('Eliminar', array('class' => 'btn btn-warning')) }}
						{{ Form::close() }}
				</div>
			</section>
		</div>
	</div>

@stop