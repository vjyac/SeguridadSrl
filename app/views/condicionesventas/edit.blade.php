@extends('layouts.default')

@section('content')

	<div class="row">

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/condicionesventas') }}">Condiciones de Ventas</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="{{ URL::to('/condicionesventas/create') }}">Crear nueva Condicion de Venta</a>
	</ul>
</nav>


		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">{{ $title }}</header>
				<div class="panel-body">
					{{ Form::open(array('url' => URL::to('/condicionesventas/' . $condicionesventa->id), 'method' => 'PUT', 'class' => 'panel-body wrapper-lg')) }}

						<div class="form-group">
							<label>Condiciones de Ventas</label>
							{{ Form::text('condicionesventa', $condicionesventa->condicionesventa, array('class' => 'form-control input-lg', 'placeholder'
							 => 'Ingrese una condicion de venta')) }}<br></div>
							<?php 

							if ($errors->first('condicionesventa')) {
								?>

									<div class="alert alert-danger">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<i class="fa fa-ban-circle"></i>
											<strong>Ups... error!</strong>
											<div class="alert-link">{{ $errors->first('condicionesventa') }}</div>
										</div>

								<?php
							}

							?>							 

						{{ Form::submit('Modificar', array('class' => 'btn btn-primary')) }}
				</div>
			</section>
		</div>
	</div>

@stop