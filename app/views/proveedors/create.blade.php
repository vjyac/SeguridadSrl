@extends('layouts.default')

@section('content')
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
			<a class="navbar-brand" href="{{ URL::to('/proveedors') }}">Proveedores</a>
		</div>
	</nav>

	<div class="col-sm-6">
		<section class="panel panel-default">
			<header class="panel-heading font-bold">Proveedor</header>
			<div class="panel-body">
				{{ Form::open(array('route' => 'proveedors.store', 'class' => 'panel-body wrapper-lg')) }}
				<div class="form-group">
					<label>Proveedor</label>
					{{ Form::text('proveedor', '', array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese un proveedor')) }}
					<br>
					<?php 

							if ($errors->
					first('proveedor')) {
								?>
					<div class="alert alert-danger">
						<button type="button" class="close" data-dismiss="alert">&times;</button> <i class="fa fa-ban-circle"></i> <strong>Ups... error!</strong>
						<div class="alert-link">{{ $errors->first('proveedor') }}</div>
					</div>

					<?php
					}
					?>
					
					<label>Cuit</label>
					{{ Form::text('cuit', '', array('class' =>
					'form-control input-lg', 'placeholder' => 'Ingrese N° cuit sin guines')) }}
					<br>

					<label>Direccion</label>
					{{ Form::text('direccion', '', array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese una direccion')) }}
					<br>

					<label>Ciudad</label>
				{{ Form::text('ciudad', '', array('class' => 'form-control input-lg', 'id' =>'ciudad', 'placeholder' => 'Ingrese un tipo de ciudad')) }}

				{{ Form::hidden('ciudads_id' , Input::old('ciudads_id'), array('id' =>'ciudads_id')) }}
					<br>

					<label>Telefono</label>
					{{ Form::text('telefono', '', array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese un telefono')) }}
					<br>

					<label>Contacto</label>
					{{ Form::text('contacto', '', array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese un contacto')) }}
					<br>

					<label>Responsabilidad Iva</label>
				{{ Form::text('responsabilidadesiva', '', array('class' => 'form-control input-lg', 'id' =>'responsabilidadesiva', 'placeholder' => 'Ingrese un tipo de responsabilidad iva')) }}

				{{ Form::hidden('responsabilidadesivas_id' , Input::old('responsabilidadesivas_id'), array('id' =>'responsabilidadesivas_id')) }}
					<br>


				{{ Form::submit('Agregar', array('class' => 'btn btn-primary')) }}
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
    
    $("#ciudad").autocomplete({
		source: "/ciudads/search",
      	select: function( event, ui ) {
      		$( '#ciudads_id' ).val( ui.item.id );
      }
  });


});  
</script>



@stop