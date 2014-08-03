@extends('layouts.default')

@section('content')

	<div class="row">

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/tiposdocumentos') }}">Tipos Documentos</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="{{ URL::to('/tiposdocumentos/create') }}">Crear nuevo tipo documento</a>
	</ul>
</nav>


		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">{{ $title }}</header>
				<div class="panel-body">
					{{ Form::open(array('url' => URL::to('/tiposdocumentos/' . $tiposdocumento->id), 'method' => 'PUT', 'class' => 'panel-body wrapper-lg')) }}

						<div class="form-group">
							<label>Tipos Documentos</label>
							{{ Form::text('tiposdocumento', $tiposdocumento->tiposdocumento, array('class' => 'form-control input-lg', 'placeholder'
							 => 'Ingrese un tipo de documento')) }}<br></div>
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

						{{ Form::submit('Modificar', array('class' => 'btn btn-primary')) }}
				</div>
			</section>
		</div>
	</div>

@stop