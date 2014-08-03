@extends('layouts.default')


@section('content')
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<div class="row">

	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
			<a class="navbar-brand" href="{{ URL::to('/ciudads') }}">Ciudades</a>
		</div>
	</nav>

	<div class="col-sm-6">
		<section class="panel panel-default">
			<header class="panel-heading font-bold">Ciudades</header>
			<div class="panel-body">
				{{ Form::open(array('route' => 'ciudads.store', "autocomplete"=>"off"
, 'class' => 'panel-body wrapper-lg')) }}
				<div class="form-group">
					<label>Ciudad</label>
					{{ Form::text('ciudad', '', array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese una ciudad')) }}
					<?php

						if ($errors->
					first('ciudad')) {
					?>
					<span class="badge bg-danger">{{ $errors->first('Ciudad') }}</span>

					<?php
						}
					?></div>

				<!--
	populate form:
	http://stackoverflow.com/questions/19015502/populate-a-form-selection-field-in-laravel-4-from-database-with-conditions
	{{ Form::select( 'provincia', Provincia::All()->
				lists('provincia', 'id'), Input::get('provincia'), array( "placeholder" => "", 'class' => 'form-control input-lg')) }}


-->



{{ Form::text('provincia', '', array('class' => 'form-control input-lg', 'id' =>'provincia', 'placeholder' => 'Ingrese una provincia')) }}

			{{ Form::hidden('provincia_id' , Input::old('provincia_id'), array('id' =>'provincia_id')) }}
				<br>
				{{ Form::submit('Agregar', array('class' => 'btn btn-primary')) }}
			</div>
		</section>
	</div>
</div>


{{ Form::close() }}

<script src="/js/app.v2.js"></script>

<script>

var jq = jQuery.noConflict();
    jq(document).ready( function(){


    $("#provincia").autocomplete({
		source: "/provincias/search",
      	select: function( event, ui ) {
      		$( '#provincia_id' ).val( ui.item.id );
      }
  });


});


</script>
@stop
