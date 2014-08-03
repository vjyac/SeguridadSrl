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
			{{ Form::open(array('url' => '/articulos/' . $articulo->id, 'class' => 'panel-body wrapper-lg')) }}
					{{ Form::hidden('_method', 'DELETE') }}
			<label>Articulo</label>
			<div class="form-control input-lg">{{ $articulo->articulo }}</div>
			<br>

			<?php
				$rubro = Rubro::find($articulo->
			rubros_id);
			?>
			<label>Rubro</label>
			<div class="form-control input-lg">{{ $rubro->rubro }}</div>
			<br>

			<?php
				$proveedor = Proveedor::find($articulo->
			proveedors_id);
			?>
			<label>Proveedor</label>
			<div class="form-control input-lg">{{ $proveedor->proveedor }}</div>
			<br>

			<label>Precio Base</label>
			<div class="form-control input-lg">{{ $articulo->precio_base }}</div>
			<br>

			<label>Utilidad %</label>
			<div class="form-control input-lg">{{ $articulo->utilidad }}</div>
			<br>

			<label>Iva %</label>
			<div class="form-control input-lg">{{ $articulo->iva }}</div>
			<br>

			<label>Precio Publico</label>
			<div class="form-control input-lg">{{ $articulo->precio_publico }}</div>
			<br>
			{{ Form::submit('Eliminar', array('class' => 'btn btn-primary')) }}
		</div>
	</section>
</div>
</div>
<script src="/js/app.v2.js"></script>

@stop