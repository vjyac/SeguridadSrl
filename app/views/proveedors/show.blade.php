@extends('layouts.default')

@section('content')

	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
			<a class="navbar-brand" href="{{ URL::to('/proveedors') }}">Proveedores</a>
		</div>
	</nav>

	<div class="col-sm-6">
		<section class="panel panel-default">
			<header class="panel-heading font-bold">Proveedor</header>
			<div class="panel-body">
					{{ Form::open(array('url' => '/proveedors/' . $proveedor->id, 'class' => 'panel-body wrapper-lg')) }}
					{{ Form::hidden('_method', 'DELETE') }}

				<div class="form-group">
					<label>Proveedor</label>
					<div class="form-control input-lg"> {{ $proveedor->proveedor }} </div><br>

					<label>Cuit</label>
					<div class="form-control input-lg"> {{ $proveedor->cuit }} </div><br>

					<label>Direccion</label>
					<div class="form-control input-lg"> {{ $proveedor->direccion }} </div><br>										

					<?php
								$ciudad = Ciudad::find($proveedor->ciudads_id);

					?>

					<label>Ciudad</label>
					<div class="form-control input-lg"> {{ $ciudad->ciudad }} </div><br>

					<label>Telefono</label>
					<div class="form-control input-lg"> {{ $proveedor->telefono }} </div><br>										

					<label>Contacto</label>
					<div class="form-control input-lg"> {{ $proveedor->contacto }} </div><br>										


					<?php
								$responsabilidadesiva = Responsabilidadesiva::find($proveedor->responsabilidadesivas_id);

					?>

					<label>Responsabilidad Iva</label>
					<div class="form-control input-lg"> {{ $responsabilidadesiva->responsabilidadesiva }} </div><br>



				{{ Form::submit('Eliminar', array('class' => 'btn btn-warning')) }}
			</div>
		</section>
	</div>
</div>




@stop