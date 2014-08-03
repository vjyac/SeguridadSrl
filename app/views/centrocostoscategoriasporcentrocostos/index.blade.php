@extends('layouts.default')

@section('content')
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>


<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/centrocostos') }}">Volver</a>
	</div>
</nav>




		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">Agregar Centro costos categoria a: {{ $centrocostos->centrocosto }}</header>
				<div class="panel-body">
					{{ Form::open(array('route' => 'centrocostoscategoriasporcentrocostos.store', 'class' => 'panel-body wrapper-lg')) }}
						<div class="form-group">
							<label>centro costos categoria</label>
							
							{{ Form::text('centrocostoscategoria', '', array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese un centro costos categoria', 'id' => 'centrocostoscategorias')) }}<br>

							{{ Form::hidden('centrocostoscategorias_id' , 0, array('id' =>'centrocostoscategorias_id')) }}

							<?php 

							if ($errors->first('centrocostoscategorias')) {
								?>

									<div class="alert alert-danger">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<i class="fa fa-ban-circle"></i>
											<strong>Ups... error!</strong>
											<div class="alert-link">{{ $errors->first('centrocostoscategorias') }}</div>
										</div>

								<?php
							}

							?>

							<label>Porcentaje</label>
							{{ Form::text('porcentaje', '', array('class' => 'form-control input-lg', 'placeholder' => 'Ingrese un porcentaje')) }}<br>

							<?php 

							if ($errors->first('porcentaje')) {
								?>

									<div class="alert alert-danger">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<i class="fa fa-ban-circle"></i>
											<strong>Ups... error!</strong>
											<div class="alert-link">{{ $errors->first('porcentaje') }}</div>
										</div>

								<?php
							}

							?>

							{{ Form::hidden('centrocostos_id' , $centrocostos->id, array('id' =>'centrocostos_id')) }}

						</div>

						{{ Form::submit('Agregar', array('class' => 'btn btn-primary')) }}
				</div>
			</section>
		</div>




		<div class="col-sm-6">

			<section class="panel panel-default">
				<header class="panel-heading">{{ $title }}</header>
				<div class="panel-body">

	<?php



		if (count($centrocostoscategoriasporcentrocostos)>0 )  {


?>

								<div class="table-responsive">
									<table class="table table-striped b-t b-light text-sm">
										<thead>
											<tr>
												<th>Id</th>
												<th>Centro costos categoria</th>
												<th>Porcentaje</th>
												<th>Accion</th>
											</tr>
										</thead>
										<tbody>
											
												<?php
												$total = 0;


											foreach ($centrocostoscategoriasporcentrocostos as $centrocostoscategoriasporcentrocosto)
											{

													$centrocostoscategorias = Centrocostoscategoria::find($centrocostoscategoriasporcentrocosto->centrocostoscategorias_id);
													echo "<tr>";
											        echo "<td>" . $centrocostoscategoriasporcentrocosto->id . "</td>";
											        echo "<td>" . $centrocostoscategorias->centrocostoscategoria . "</td>";
											        echo "<td>" . $centrocostoscategoriasporcentrocosto->porcentaje . "</td>";
											        echo "<td>" ;
													
													echo "<a href='/centrocostoscategoriasporcentrocostos/" . $centrocostoscategoriasporcentrocosto->id . "/eliminar' class='btn btn-xs btn-warning'>Eliminar</a> ";


													print "</td>";
													print "</tr>";

													$total += $centrocostoscategoriasporcentrocosto->porcentaje;
											    
											}

													echo "<tr>";
											        echo "<td></td>";
											        echo "<td></td>";
											        echo "<td>" . number_format($total,2) . "</td>";
											        echo "<td></td>";
													print "</tr>";



												?>



											
									</tbody>
								</table>
								<?php
									
										if ($total==100) {
											if ($centrocostos->estado == "inactivo") {
												echo "<a href='/centrocostos/" . $centrocostos->id . "/activar' class='btn btn-primary'>Activar</a> ";
											}
										} else {
											echo "Para activar es necesario que la suma llegue a 100.";
										}
									
								?>

							</div>
							<footer class="panel-footer">

<div class="row">
									<div class="col-sm-4 hidden-xs">
										<!-- <select class="input-sm form-control input-s-sm inline">
											<option value="0">Bulk action</option>
											<option value="1">Delete selected</option>
											<option value="2">Bulk edit</option>
											<option value="3">Export</option>
										</select> -->
									</div>
									<div class="col-sm-4 text-center">
										<!-- <small class="text-muted inline m-t-sm m-b-sm">showing 20-30 of 50 items</small> -->
									</div>
									<div class="col-sm-4 text-right text-center-xs">

									

									</div>
								</div>

							</footer>
						
<?php

		}


	?>	

	</div>
	</section>
	</div>

<script src="/js/app.v2.js"></script>

<script>

var jq = jQuery.noConflict();
    jq(document).ready( function(){
        

    $("#centrocostoscategorias").autocomplete({
		source: "/centrocostoscategorias/search",
      	select: function( event, ui ) {
      		$( '#centrocostoscategorias_id' ).val( ui.item.id );
      }
  });


});

  
</script>

@stop