@extends('layouts.default')

@section('content')

	<div class="row">

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/empresasdocumentosnumeros') }}">Empresa documentos numeros</a>
	</div>
</nav>


		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">{{ $title }}</header>
				<div class="panel-body">
					{{ Form::open(array('url' => URL::to('/empresasdocumentosnumeros/' . $empresasdocumentosnumero->id), 'method' => 'PUT', 'class' => 'panel-body wrapper-lg')) }}

				<?php
						$empresa = Empresa::find($empresasdocumentosnumero->empresas_id);
						$tiposdocumento = Tiposdocumento::find($empresasdocumentosnumero->tiposdocumentos_id);

				?>

				<div class="form-group">
					<label>Empresa: </label>
					{{ $empresa->empresa }}
				</div>



				<div class="form-group">
					<label>Tipo Documento: </label>
					{{ $tiposdocumento->tiposdocumento }}
				</div>



						<div class="form-group">
							<label>Numeros</label>
							{{ Form::text('numero', $empresasdocumentosnumero->numero, array('class' => 'form-control input-lg', 'placeholder'
							 => 'Ingrese numero')) }}<br></div>
							<?php

							if ($errors->first('numero')) {
								?>

									<div class="alert alert-danger">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<i class="fa fa-ban-circle"></i>
											<strong>Ups... error!</strong>
											<div class="alert-link">{{ $errors->first('numero') }}</div>
										</div>

								<?php
							}

							?>
						{{ Form::submit('Modificar', array('class' => 'btn btn-primary')) }}
				</div>
			</section>
		</div>
	</div>

@stop
