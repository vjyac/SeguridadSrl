@extends('layouts.default')

@section('content')

	<div class="row">

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/responsabilidadesivas') }}">Responsabilidadesivas</a>
	</div>
</nav>

		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">Responsabilidadesiva</header>
				<div class="panel-body">
					{{ Form::open(array('route' => 'responsabilidadesivas.store', 'class' => 'panel-body wrapper-lg')) }}
						<div class="form-group">
							<label>Responsabilidades iva</label>
							
							{{ Form::text('responsabilidadesiva', '', array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese una responsabilidad iva')) }}<br>
							<?php 

							if ($errors->first('responsabilidadesiva')) {
								?>

									<div class="alert alert-danger">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<i class="fa fa-ban-circle"></i>
											<strong>Ups... error!</strong>
											<div class="alert-link">{{ $errors->first('responsabilidadesiva') }}</div>
										</div>

								<?php
							}
							?>

							<label>Documento venta</label>
							
								{{ Form::select( 'venta_tiposdocumentos_id', Tiposdocumento::All()->
											lists('tiposdocumento', 'id'), Input::get('venta_tiposdocumentos_id'), array( "placeholder" => "", 'class' => 'form-control input-lg')) }}



							<label>Documento recibo</label>
								{{ Form::select( 'recibo_tiposdocumentos_id', Tiposdocumento::All()->
											lists('tiposdocumento', 'id'), Input::get('recibo_tiposdocumentos_id'), array( "placeholder" => "", 'class' => 'form-control input-lg')) }}
											
							<label>Documento nc</label>
								{{ Form::select( 'nc_tiposdocumentos_id', Tiposdocumento::All()->
											lists('tiposdocumento', 'id'), Input::get('nc_tiposdocumentos_id'), array( "placeholder" => "", 'class' => 'form-control input-lg')) }}

							<label>Documento nd</label>
								{{ Form::select( 'nd_tiposdocumentos_id', Tiposdocumento::All()->
											lists('tiposdocumento', 'id'), Input::get('nd_tiposdocumentos_id'), array( "placeholder" => "", 'class' => 'form-control input-lg')) }}

						</div>

						{{ Form::submit('Agregar', array('class' => 'btn btn-primary')) }}
				</div>
			</section>
		</div>
	</div>

<script src="/js/app.v2.js"></script>
@stop