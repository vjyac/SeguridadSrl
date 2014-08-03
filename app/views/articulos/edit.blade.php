@extends('layouts.default')

@section('content')
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<!-- <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
-->

<script src="/js/jquery-2.0.3.min.js"></script>

<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="/js/jquery.number.min.js"></script>


<link rel="stylesheet" href="/resources/demos/style.css">

<div class="row">

<nav class="navbar navbar-inverse">
<div class="navbar-header">
	<a class="navbar-brand" href="{{ URL::to('/articulos') }}">Articulos</a>
</div>
</nav>

<div class="col-sm-8">
<section class="panel panel-default">
	<header class="panel-heading font-bold">Articulo</header>
	<div class="panel-body">
				{{ Form::open(array('url' => URL::to('/articulos/' . $articulo->id), 'method' => 'PUT', 'class' => 'panel-body wrapper-lg')) }}

			<label>Articulo</label>
			{{ Form::text('articulo', $articulo->articulo, array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese un articulos')) }}
			<br>
					<?php 

						if ($errors->first('articulo')) {
					?>
						<span class="badge bg-danger">{{ $errors->first('articulo') }}</span>

					<?php
						}
					?>



			<?php
				$rubro = Rubro::find($articulo->rubros_id);
			?>

			<label>Rubro</label>
			{{ Form::text('rubro', $rubro->rubro, array('class' => 'form-control input-lg', 'id' =>'rubro', 'placeholder' => 'Ingrese un tipo de rubro')) }}
				{{ Form::hidden('rubros_id' , $articulo->rubros_id, array('id' =>'rubros_id')) }}

					<?php 

						if ($errors->first('rubros_id')) {
					?>
						<span class="badge bg-danger">{{ $errors->first('rubros_id') }}</span>

					<?php
						}
					?>
				<br>



			<?php
				$proveedor = Proveedor::find($articulo->proveedors_id);
			?>

			<label>Proveedor</label>
			{{ Form::text('proveedor', $proveedor->proveedor, array('class' => 'form-control input-lg', 'id' =>'proveedor', 'placeholder' => 'Ingrese un proveedor')) }}
				{{ Form::hidden('proveedors_id' , $articulo->proveedors_id, array('id' =>'proveedors_id')) }}
			<br>

			<label>Precio Base</label>
			{{ Form::text('precio_base', $articulo->precio_base, array('class' =>
					'form-control input-lg', 'id' =>'precio_base', 'placeholder' => 'Ingrese un precio base')) }}
			<br>

			<label>Utilidad %</label>
			{{ Form::text('utilidad', $articulo->utilidad, array('class' => 'form-control input-lg', 'id' =>'utilidad', 'placeholder' => '% utilidad')) }}
			<br>

			<label>Iva %</label>
			{{ Form::text('iva', $articulo->iva, array('class' => 'form-control input-lg', 'id' =>'iva', 'placeholder' => '% iva')) }}
			<br>

			<label>Precio Publico</label>
			{{ Form::text('precio_publico', $articulo->precio_publico, array('class' => 'form-control input-lg', 'id' =>'precio_publico','placeholder' => 'Ingrese un precio_publico')) }}
			<br>
			{{ Form::submit('Modificar', array('class' => 'btn btn-primary')) }}
		</div>
	</section>
</div>
</div>

<script>
  $(function() {
    
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


	$('#precio_base').number( true, 2);
	$('#utilidad').number( true, 2 );
	$('#iva').number( true, 2 );
	$('#precio_publico').number( true, 2 );


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
      		var precio_base =  parseFloat($('#precio_base').val());
      		var utilidad =  parseFloat($('#utilidad').val());
      		precio_publico = (precio_base) + (precio_base * utilidad / 100);
      		var iva =  parseFloat($('#iva').val());
      		precio_publico = (precio_publico) + (precio_base * iva / 100);

      		$( '#precio_publico' ).val( precio_publico ); 
}


});  
</script>
@stop