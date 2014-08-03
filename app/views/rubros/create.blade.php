@extends('layouts.default')

@section('content')

	<div class="row">

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/rubros') }}">Rubros</a>
	</div>
</nav>

		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">Rubro</header>
				<div class="panel-body">
					{{ Form::open(array('route' => 'rubros.store', 'class' => 'panel-body wrapper-lg')) }}
						<div class="form-group">
							<label>Rubro</label>
							
							{{ Form::text('rubro', '', array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese un rubro')) }}<br>
							<?php 

							if ($errors->first('rubro')) {
								?>

									<div class="alert alert-danger">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<i class="fa fa-ban-circle"></i>
											<strong>Ups... error!</strong>
											<div class="alert-link">{{ $errors->first('rubro') }}</div>
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