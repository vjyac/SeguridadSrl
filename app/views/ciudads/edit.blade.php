@extends('layouts.default')

@section('content')
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>


	<div class="row">

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/ciudads') }}">ciudads</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="{{ URL::to('ciudads/create') }}">Crear nueva ciudad</a>
	</ul>
</nav>


		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">{{ $title }}</header>
				<div class="panel-body">
					{{ Form::open(array('url' => URL::to('ciudads/' . $ciudad->id), 'method' => 'PUT', 'class' => 'panel-body wrapper-lg')) }}

						<div class="form-group">
							<label>ciudad</label>
							{{ Form::text('ciudad', $ciudad->ciudad, array('class' => 'form-control input-lg', 'placeholder'
							 => 'Ingrese una ciudad')) }}<br></div>
							<?php 

							if ($errors->first('ciudad')) {
								?>

									<span class="badge bg-danger">{{ $errors->first('ciudad') }}</span>

								<?php
							}
							?>							 




						<div class="form-group">

						<?php

							$provincia = Provincia::find($ciudad->provincias_id);
						?>


						<label>Provincia</label>
					{{ Form::text('provincia', $provincia->provincia, array('class' => 'form-control input-lg', 'id' =>'provincia', 'placeholder' => 'Ingrese una provincia')) }}

					{{ Form::hidden('provincias_id' , $ciudad->provincias_id, array('id' =>'provincias_id')) }}
						<br>


							<?php 

							if ($errors->first('provincias_id')) {
								?>

								<span class="badge bg-danger">{{ $errors->first('provincias_id') }}</span>

								<?php
							}
							?>
						</div>


						{{ Form::submit('Modificar', array('class' => 'btn btn-primary')) }}
				</div>
			</section>
		</div>
	</div>
<script src="/js/app.v2.js"></script>

<script>

var jq = jQuery.noConflict();
    jq(document).ready( function(){
        

    $("#provincia").autocomplete({
		source: "/provincias/search",
      	select: function( event, ui ) {
      		$( '#provincias_id' ).val( ui.item.id );
      }
  });


});

  
</script>
@stop