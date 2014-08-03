@extends('layouts.default')

@section('content')

	<div class="row">

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/condicionesventas') }}">Condiciones de Venta</a>
	</div>
</nav>

		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">Condiciones de Venta</header>
				<div class="panel-body">
					{{ Form::open(array('route' => 'condicionesventas.store', 'class' => 'panel-body wrapper-lg')) }}
						<div class="form-group">
							<label>Condicion de venta</label>
							
							{{ Form::text('condicionesventa', '', array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese una condicion de Venta')) }}<br>
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
						</div>

						{{ Form::submit('Agregar', array('class' => 'btn btn-primary')) }}
				</div>
			</section>
		</div>
	</div>

@stop