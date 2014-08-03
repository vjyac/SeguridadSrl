@extends('layouts.default')

@section('content')

	<div class="row">

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/provincias') }}">Provincias</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="{{ URL::to('provincias/create') }}">Crear nueva provincia</a>
	</ul>
</nav>


		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">{{ $title }}</header>
				<div class="panel-body">
					{{ Form::open(array('url' => URL::to('provincias/' . $provincia->id), 'method' => 'PUT', 'class' => 'panel-body wrapper-lg')) }}

						<div class="form-group">
							<label>Provincia</label>
							{{ Form::text('provincia', $provincia->provincia, array('class' => 'form-control input-lg', 'placeholder'
							 => 'Ingrese una provincia')) }}<br></div>
							<?php 

							if ($errors->first('provincia')) {
								?>

									<div class="alert alert-danger">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<i class="fa fa-ban-circle"></i>
											<strong>Ups... error!</strong>
											<div class="alert-link">{{ $errors->first('provincia') }}</div>
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