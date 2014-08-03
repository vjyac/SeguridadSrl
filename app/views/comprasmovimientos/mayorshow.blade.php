@extends('layouts.default')


@section('content')
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/js/datepicker/datepicker.css" type="text/css" cache="false" />

<div class="row">

	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
			<a class="navbar-brand" href="{{ URL::to('/ventasmovimientos') }}">Movimientos Recibos</a>
		</div>
	</nav>

	<div class="col-sm-6">
		<section class="panel panel-default">
			<header class="panel-heading font-bold">{{ $title }}</header>
			<div class="panel-body">
				{{ Form::open(array('route' => 'ventasmovimientos.mayorshow', "autocomplete"=>"off"
, 'class' => 'panel-body wrapper-lg')) }}
				

          @if (isset($flash_message))
          <div class="alert alert-warning">{{ $flash_message }}</div>
          @endif

										
								<div class="row">
									<div class="col-xs-5">
									<label>Fecha desde</label>
										{{ Form::text('fecha_desde', '', array('class' => 'datepicker-input form-control input-lg', 'id' =>'fecha_desde', 'placeholder' => 'Fecha', 'data-date-format' => 'dd-mm-yyyy')) }}
									</div>
								</div>

								<div class="row">
									<div class="col-xs-5">
									<label>Fecha hasta</label>
										{{ Form::text('fecha_hasta', '', array('class' => 'datepicker-input form-control input-lg', 'id' =>'fecha_hasta', 'placeholder' => 'Fecha', 'data-date-format' => 'dd-mm-yyyy')) }}
									</div>
								</div>


									
<label>Cliente</label>
{{ Form::text('cliente', '', array('class' => 'form-control input-lg', 'id' =>'cliente', 'placeholder' => 'Ingrese un cliente o vacio para ver todos')) }}

{{ Form::hidden('clientes_id' , Input::old('clientes_id'), array('id' =>'clientes_id')) }}


<br>
				{{ Form::submit('Buscar movimientos Recibos', array('class' => 'btn btn-primary')) }}

				{{ Form::close() }}
			</div>
		</section>
	</div>
</div>


<script src="/js/app.v2.js"></script>

<script>

var jq = jQuery.noConflict();
    jq(document).ready( function(){
        
 

    $("#cliente").autocomplete({
		source: "/clientes/search",
      	select: function( event, ui ) {
      		$( '#clientes_id' ).val( ui.item.id );
      }
  });




});

  
</script>

<script src="/js/datepicker/bootstrap-datepicker.js" cache="false"></script>

@stop