@extends('layouts.default')

@section('content')

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/provincias') }}">Empresas Documentos Numeros</a>
	</div>

</nav>


	<?php


		if (count($empresasdocumentosnumeros)>0 )  {


?>
							<section class="panel panel-default">
								<header class="panel-heading">{{ $title }}</header>

								<div class="table-responsive">
									<table class="table table-striped b-t b-light text-sm">
										<thead>
											<tr>
												<th>Id</th>
												<th>Empresa</th>
												<th>Tipo Documento</th>
												<th>Numero</th>
												<th>Accion</th>
											</tr>
										</thead>
										<tbody>

												<?php

											foreach ($empresasdocumentosnumeros as $empresasdocumentosnumero)
											{

													$empresa = Empresa::find($empresasdocumentosnumero->empresas_id);
													$tiposdocumento = Tiposdocumento::find($empresasdocumentosnumero->tiposdocumentos_id);

													echo "<tr>";
											        echo "<td>" . $empresasdocumentosnumero->id . "</td>";
											        echo "<td>" . $empresa->empresa . "</td>";
															echo "<td>" . $tiposdocumento->tiposdocumento . "</td>";
															echo "<td>" . $empresasdocumentosnumero->numero . "</td>";
											        echo "<td>" ;

													echo "<a href='/empresasdocumentosnumeros/" . $empresasdocumentosnumero->id . "/edit' class='btn btn-xs btn-primary'>Editar</a> ";

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

									{{ $empresasdocumentosnumeros->links()}}

									</div>
								</div>

							</footer>
						</section>
<?php

		}


	?>

@stop
