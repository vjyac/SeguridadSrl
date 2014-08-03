@extends('layouts.default')

@section('content')


<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/tiposdocumentos') }}">Tipos Documentos</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="{{ URL::to('/tiposdocumentos/create') }}">Crear nuevo Tipo Documento</a>
	</ul>
</nav>

		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">Tipos Documentos</header>
				<div class="panel-body">
					{{ Form::open(array('url' => '/tiposdocumentos/' . $tiposdocumento->id, 'class' => 'panel-body wrapper-lg')) }}
					{{ Form::hidden('_method', 'DELETE') }}

						<div class="form-group">
							<label>Tipo Documento</label>
							
							<div class="form-control input-lg">
								{{ $tiposdocumento->tiposdocumento }}
							</div><br>

						{{ Form::submit('Eliminar', array('class' => 'btn btn-warning')) }}
						{{ Form::close() }}
				</div>
			</section>
		</div>
	</div>

@stop