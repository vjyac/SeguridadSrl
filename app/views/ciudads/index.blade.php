@extends('layouts.default')

@section('content')

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/ciudads') }}">ciudades</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="{{ URL::to('ciudads/create') }}">Crear nueva ciudad</a>
	</ul>
</nav>


	<?php


		if (count($ciudads)>0 )  {


?>
							<section class="panel panel-default">
								<header class="panel-heading">{{ $title }}</header>

								<div class="table-responsive">
									<table class="table table-striped b-t b-light text-sm">
										<thead>
											<tr>
												<th>ciudad</th>
												<th>Provincia</th>
												<th>Accion</th>
											</tr>
										</thead>
										<tbody>
											
												<?php



											foreach ($ciudads as $ciudad)
											{
													$provincia = Provincia::find($ciudad->provincias_id);
													echo "<tr>";
											        echo "<td>" . $ciudad->ciudad . "</td>";
											        echo "<td>" . $provincia->provincia . "</td>";
											        echo "<td>" ;
													
													echo "<a href='/ciudads/" . $ciudad->id . "/edit' class='btn btn-xs btn-primary'>Editar</a> ";

													echo "<a href='/ciudads/" . $ciudad->id . "' class='btn btn-xs btn-info'>Ver</a> ";


													print "</td>";
													print "</tr>";

											    
											}


												?>

											
									</tbody>
								</table>
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

									{{ $ciudads->links()}}

									</div>
								</div>

							</footer>
						</section>
<?php

		}


	?>	

<script src="js/app.v2.js"></script>

@stop