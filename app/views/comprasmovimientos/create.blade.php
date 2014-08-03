@extends('layouts.default')


@section('content')
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/js/datepicker/datepicker.css" type="text/css" cache="false" />

<div class="row">

	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
			<a class="navbar-brand" href="{{ URL::to('/comprasmovimientos') }}">Compras Movimientos</a>
		</div>
	</nav>

	<div class="col-sm-6">
		<section class="panel panel-default">
			<header class="panel-heading font-bold">Compras Movimientos</header>
			<div class="panel-body">
				{{ Form::open(array('route' => 'comprasmovimientos.store', "autocomplete"=>"off"
, 'class' => 'panel-body wrapper-lg')) }}
			
						
<div class="row">				
<div class="col-xs-6">
	<div class="form-group">
		<label>Fecha</label>
			{{ Form::text('fecha', '', array('class' => 'datepicker-input form-control input-lg', 'id' =>'fecha', 'placeholder' => 'Fecha', 'data-date-format' => 'dd-mm-yyyy')) }}
	</div>
</div>
</div>

<div class="row">	
<div class="col-xs-6">
	<div class="form-group">
		<label>Fecha vencimiento</label>
			{{ Form::text('fecha_vencimiento', '', array('class' => 'datepicker-input form-control input-lg', 'id' =>'fecha_vencimiento', 'placeholder' => 'Fecha vencimiento', 'data-date-format' => 'dd-mm-yyyy')) }}
	</div>
	</div>
</div>

<div class="form-group">
	<label>Condiciones de Venta</label>
		{{ Form::select( 'condicionescompras_id', Condicionesventa::All()->
				lists('condicionesventa', 'id'), Input::get('condicionesventa'), array( "placeholder" => "", 'class' => 'form-control input-lg')) }}
</div>

<div class="form-group">
	<label>Proveedor</label>
		{{ Form::text('proveedor', '', array('class' => 'form-control input-lg', 'id' =>'proveedor', 'placeholder' => 'Ingrese un proveedor')) }}
		{{ Form::hidden('proveedors_id' , Input::old('proveedors_id'), array('id' =>'proveedors_id')) }}
</div>		

<div class="form-group">
	<label>Documento tipo</label>
		{{ Form::select( 'tiposdocumentos_id', Tiposdocumento::All()->lists('tiposdocumento', 'id'), Input::get('tiposdocumentos_id'), array( "placeholder" => "", 'class' => 'form-control input-lg')) }}
</div>	

<div class="form-group">
		<label>Numero Documento</label>
			{{ Form::text('numero_documento', '', array('class' => 'form-control input-lg', 'id' =>'numero_documento', 'placeholder' => 'Ingrese un numero documento')) }}
</div>	
				{{ Form::submit('Agregar', array('class' => 'btn btn-primary')) }}

				{{ Form::close() }}
			</div>
		</section>
	</div>
</div>


<script src="/js/app.v2.js"></script>

<script>

var jq = jQuery.noConflict();
    jq(document).ready( function(){
        

    $("#proveedor").autocomplete({
		source: "/proveedors/search",
      	select: function( event, ui ) {
      		$( '#proveedors_id' ).val( ui.item.id );
      }
  });


});

  
</script>

<script src="/js/datepicker/bootstrap-datepicker.js" cache="false"></script>

@stop