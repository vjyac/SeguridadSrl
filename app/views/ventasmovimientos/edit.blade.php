@extends('layouts.default')


@section('content')
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/js/datepicker/datepicker.css" type="text/css" cache="false" />

<div class="row">

	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
			<a class="navbar-brand" href="{{ URL::to('/ventasmovimientos') }}">Ventas Movimientos</a>
		</div>
	</nav>

	<div class="col-sm-6">
		<section class="panel panel-default">
			<header class="panel-heading font-bold">Ventas Movimientos</header>
			<div class="panel-body">
				{{ Form::open(array('url' => URL::to('ventasmovimientos/' . $ventasmovimiento->id), 'method' => 'PUT', 'class' => 'panel-body wrapper-lg')) }}
				<div class="row">
					<div class="col-xs-6">
						<label>Fecha</label>
						{{ Form::text('fecha', date("d-m-Y", strtotime($ventasmovimiento->fecha)), array('class' => 'datepicker-input form-control input-lg', 'id' =>'fecha', 'placeholder' => 'Fecha', 'data-date-format' => 'dd-mm-yyyy')) }}
						<br> <?php
							if ($errors->first('fecha')) {
									?>
								<div class="alert alert-danger">
								<button type="button" class="close" data-dismiss="alert">&times;</button> <i class="fa fa-ban-circle"></i> <strong>Ups... error!</strong>
								<div class="alert-link">{{ $errors->first('fecha') }}</div>
							</div>
						<?php } ?>

					</div>
				</div>

				<div class="row">
					<div class="col-xs-6">
						<label>Fecha vencimiento</label>
						{{ Form::text('fecha_vencimiento', date("d-m-Y", strtotime($ventasmovimiento->fecha_vencimiento)), array('class' => 'datepicker-input form-control input-lg', 'id' =>'fecha_vencimiento', 'placeholder' => 'Fecha vencimiento', 'data-date-format' => 'dd-mm-yyyy')) }}


						<br> <?php
							if ($errors->first('fecha_vencimiento')) {
									?>
								<div class="alert alert-danger">
								<button type="button" class="close" data-dismiss="alert">&times;</button> <i class="fa fa-ban-circle"></i> <strong>Ups... error!</strong>
								<div class="alert-link">{{ $errors->first('fecha_vencimiento') }}</div>
							</div>
						<?php } ?>

					</div>
				</div>

				<label>Condiciones de Venta</label>
				{{ Form::select( 'condicionesventas_id', Condicionesventa::All()->
				lists('condicionesventa', 'id'), $ventasmovimiento->condicionesventas_id, array( "placeholder" => "", 'class' => 'form-control input-lg')) }}


				<br>
				{{ Form::submit('Modificar', array('class' => 'btn btn-primary')) }}
				<a href='/ventasmovimientos/{{ $ventasmovimiento->id }}/anular' class='btn btn-danger'>Anular</a>

				{{ Form::close() }}
			</div>
		</section>
	</div>
</div>

<script src="/js/app.v2.js"></script>

<script>

var jq = jQuery.noConflict();
    jq(document).ready( function(){




});


</script>

<script src="/js/datepicker/bootstrap-datepicker.js" cache="false"></script>
@stop
