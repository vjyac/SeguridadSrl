@extends('layouts.default')

@section('content')
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="/js/jquery-2.0.3.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="/js/jquery.number.min.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<nav class="navbar navbar-inverse">
<div class="navbar-header">
	<a class="navbar-brand" href="{{ URL::to('/articulos') }}">Articulos</a>
</div>
</nav>

<div class="col-sm-12">
<section class="panel panel-default">
	<header class="panel-heading font-bold">Articulo</header>
	<div class="panel-body">
		{{ Form::open(array('route' => 'articulos.store', 'class' => 'panel-body wrapper-lg')) }}
		<div class="form-group">

			<label>Articulo</label>
			{{ Form::text('articulo', '', array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese un articulos')) }}
			<br>

			<label>Rubro</label>
			{{ Form::text('rubro', '', array('class' => 'form-control input-lg', 'id' =>'rubro', 'placeholder' => 'Ingrese un tipo de rubro')) }}
				{{ Form::hidden('rubros_id' , Input::old('rubros_id'), array('id' =>'rubros_id')) }}
			<br>

			<label>Proveedor</label>
			{{ Form::text('proveedor', '', array('class' => 'form-control input-lg', 'id' =>'proveedor', 'placeholder' => 'Ingrese un proveedor')) }}
				{{ Form::hidden('proveedors_id' , Input::old('proveedors_id'), array('id' =>'proveedors_id')) }}
			<br>

			<label>Precio Base</label>
			{{ Form::text('precio_base', '0.00', array('class' =>
					'form-control input-lg', 'id' =>'precio_base', 'placeholder' => 'Ingrese un precio base')) }}
			<br>

			<label>Utilidad %</label>
			{{ Form::text('utilidad', '0.00', array('class' => 'form-control input-lg', 'id' =>'utilidad', 'placeholder' => '% utilidad')) }}
			<br>

			<label>Iva %</label>
			{{ Form::text('iva', '21.00', array('class' => 'form-control input-lg', 'id' =>'iva', 'placeholder' => '% iva')) }}
			<br>

			<label>Precio Publico</label>
			{{ Form::text('precio_publico', '0.00', array('class' => 'form-control input-lg', 'id' =>'precio_publico','placeholder' => 'Ingrese un precio_publico')) }}
			<br>
			{{ Form::submit('Agregar', array('class' => 'btn btn-primary')) }}
			
		</div>
	</section>
</div>
</div>


<script src="/js/app.v2.js"></script>

<script>
  var jq = jQuery.noConflict();
    jq(document).ready( function(){
  
	$("#rubro").autocomplete({
		source: "/rubros/search",
	  	select: function( event, ui ) {
	  		$( '#rubros_id' ).val( ui.item.id );
	  }
	});

	$("#proveedor").autocomplete({
		source: "/proveedors/search",
	  	select: function( event, ui ) {
	  		$( '#proveedors_id' ).val( ui.item.id );
	  }
	});


	$('#precio_base').number( true, 2, '.','');
	$('#utilidad').number( true, 2, '.','');
	$('#iva').number( true, 2, '.','');
	$('#precio_publico').number( true, 2, '.','');


	$("#precio_base").blur(function(){
		calcular_precio_pubilico();

	});

	$("#utilidad").blur(function(){
		calcular_precio_pubilico();

	});

	$("#iva").blur(function(){
		calcular_precio_pubilico();
	});



	function calcular_precio_pubilico() {
      		var precio_base = parseFloat($('#precio_base').val());
      		var utilidad = parseFloat($('#utilidad').val());
      		precio_publico = (precio_base) + (precio_base * utilidad / 100);
      		var iva = parseFloat($('#iva').val());
      		precio_publico = (precio_publico) + (precio_publico * iva / 100);
      		$( '#precio_publico' ).val( precio_publico ); 
}


});  
</script>


@stop