@extends('layouts.default')

@section('content')
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<div class="row">

	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
			<a class="navbar-brand" href="{{ URL::to('/clientes') }}">Clientes</a>
		</div>
	</nav>

	<div class="col-sm-6">
		<section class="panel panel-default">
			<header class="panel-heading font-bold">Cliente</header>
			<div class="panel-body">
				{{ Form::open(array('url' => URL::to('clientes/' . $cliente->id), 'method' => 'PUT', 'class' => 'panel-body wrapper-lg')) }}
				<div class="form-group">
					<label>Cliente</label>
					{{ Form::text('cliente', $cliente->cliente, array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese un cliente')) }}
					<br>
					<?php 

							if ($errors->
					first('cliente')) {
								?>
					<div class="alert alert-danger">
						<button type="button" class="close" data-dismiss="alert">&times;</button> <i class="fa fa-ban-circle"></i> <strong>Ups... error!</strong>
						<div class="alert-link">{{ $errors->first('cliente') }}</div>
					</div>

					<?php
					}
					?>

							{{ Form::text('cuit', $cliente->cuit, array('class' =>
					'form-control input-lg', 'placeholder' => 'Ingrese un cuit')) }}
					<br>
					{{ Form::text('direccion', $cliente->direccion, array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese una direccion')) }}
					<br>
					{{ Form::text('telefono', $cliente->telefono, array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese un telefono')) }}
					<br>
					{{ Form::text('contacto', $cliente->contacto, array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese un contacto')) }}
					<br>

					<?php
						$responsabilidadesiva = Responsabilidadesiva::find($cliente->responsabilidadesivas_id);


					?>


				{{ Form::text('responsabilidadesiva', $responsabilidadesiva->responsabilidadesiva, array('class' => 'form-control input-lg', 'id' =>'responsabilidadesiva', 'placeholder' => 'Ingrese un tipo de responsabilidad iva')) }}

				{{ Form::hidden('responsabilidadesivas_id' , $cliente->responsabilidadesivas_id, array('id' =>'responsabilidadesivas_id')) }}
					<br>


				{{ Form::submit('Modificar', array('class' => 'btn btn-primary')) }}
			</div>
		</section>
	</div>
</div>

<script>
  $(function() {
    
    $("#responsabilidadesiva").autocomplete({
		source: "/responsabilidadesivas/search",
      	select: function( event, ui ) {
      		$( '#responsabilidadesivas_id' ).val( ui.item.id );
      }
  });
});  
</script>


@stop