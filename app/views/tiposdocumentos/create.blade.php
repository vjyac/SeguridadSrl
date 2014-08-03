@extends('layouts.default')

@section('content')

	<div class="row">

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/tiposdocumentos') }}">Tipos Documentos</a>
	</div>
</nav>

		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">Tipos documentos</header>
				<div class="panel-body">
					{{ Form::open(array('route' => 'tiposdocumentos.store', 'class' => 'panel-body wrapper-lg')) }}
						<div class="form-group">
							<label>Tipo Documento</label>
							
							{{ Form::text('tiposdocumento', '', array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese un tipo de documentos')) }}<br>
							<?php 

							if ($errors->first('tiposdocumento')) {
								?>

									<div class="alert alert-danger">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<i class="fa fa-ban-circle"></i>
											<strong>Ups... error!</strong>
											<div class="alert-link">{{ $errors->first('tiposdocumento') }}</div>
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