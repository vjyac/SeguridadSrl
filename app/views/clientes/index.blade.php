@extends('layouts.default')

@section('content')

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/clientes') }}">Clientes</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="{{ URL::to('clientes/create') }}">Crear nuevo cliente</a>
	</ul>
</nav>


	<?php


		if (count($clientes)>0 )  {


?>
							<section class="panel panel-default">
								<header class="panel-heading">{{ $title }}</header>

								<div class="table-responsive">
									<table class="table table-striped b-t b-light text-sm">
										<thead>
											<tr>
												<th>Id</th>
												<th>Cliente</th>
												<th>Cuit</th>
												<th>Direccion</th>
												<th>Telefono</th>
												<th>Accion</th>
											</tr>
										</thead>
										<tbody>
											
												<?php

											foreach ($clientes as $cliente)
												{
														echo "<tr>";
												        echo "<td>" . $cliente->id . "</td>";
												        echo "<td>" . $cliente->cliente . "</td>";
												        echo "<td>" . $cliente->cuit . "</td>";
												        echo "<td>" . $cliente->direccion . "</td>";
												        echo "<td>" . $cliente->telefono . "</td>";
												        echo "<td>" ;
														
														echo "<a href='/clientes/" . $cliente->id . "/edit' class='btn btn-xs btn-primary'>Editar</a> ";

														echo "<a href='/clientes/" . $cliente->id . "' class='btn btn-xs btn-info'>Ver</a> ";

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

									{{ $clientes->links()}}

									</div>
								</div>

							</footer>
						</section>
		<?php

			}

		?>	

@stop