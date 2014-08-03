@extends('layouts.default')

@section('content')

	<div class="row">

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/centrocostos') }}">Centro costos</a>
	</div>
</nav>

		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">Centro costos</header>
				<div class="panel-body">
					{{ Form::open(array('route' => 'centrocostos.store', 'class' => 'panel-body wrapper-lg')) }}
						<div class="form-group">
							<label>Centro costos</label>
							
							{{ Form::text('centrocosto', '', array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese un nuevo centro costos')) }}<br>
							<?php 

							if ($errors->first('centrocosto')) {
								?>

									<div class="alert alert-danger">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<i class="fa fa-ban-circle"></i>
											<strong>Ups... error!</strong>
											<div class="alert-link">{{ $errors->first('centrocosto') }}</div>
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
<script src="/js/app.v2.js"></script>
@stop