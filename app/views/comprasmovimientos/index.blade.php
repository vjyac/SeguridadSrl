@extends('layouts.default')

@section('content')

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/comprasmovimientos') }}">Compras movimientos</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="{{ URL::to('comprasmovimientos/create') }}">Crear nueva compras movimientos</a>
	</ul>
</nav>


	<?php


		if (count($comprasmovimientos)>0 )  {


?>
							<section class="panel panel-default">
								<header class="panel-heading">{{ $title }}</header>

								<div class="table-responsive">
									<table class="table table-striped b-t b-light text-sm">
										<thead>
											<tr>
												<th>Id</th>
												<th>Fecha</th>
												<th>Cliente</th>
												<th>Tipo Documento</th>
												<th>Numero Documento</th>
												<th>Accion</th>
											</tr>
										</thead>
										<tbody>
											
												<?php

											foreach ($comprasmovimientos as $comprasmovimiento)
												{

														$cliente = Cliente::find($comprasmovimiento->clientes_id);
														$tiposdocumento = Tiposdocumento::find($comprasmovimiento->tiposdocumentos_id);

														
														echo "<tr>";
												        echo "<td>" . $comprasmovimiento->id . "</td>";
												        echo "<td>" . $comprasmovimiento->fecha . "</td>";
												        echo "<td>" . $cliente->cliente . "</td>";
												        echo "<td>" . $tiposdocumento->tiposdocumento . "</td>";
												        echo "<td>" . str_pad($comprasmovimiento->numero_comprobante, 12, '0', STR_PAD_LEFT) . "</td>";
												        echo "<td>" ;
														
														echo "<a href='/comprasmovimientos/" . $comprasmovimiento->id . "/edit' class='btn btn-xs btn-primary'>Editar</a> ";

														echo "<a href='/comprasmovimientos/" . $comprasmovimiento->id . "/cuerpo' class='btn btn-xs btn-success'>Ver</a> ";

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

									{{ $comprasmovimientos->links()}}

									</div>
								</div>

							</footer>
						</section>
		<?php

			}

		?>	
<script src="/js/app.v2.js"></script>
@stop