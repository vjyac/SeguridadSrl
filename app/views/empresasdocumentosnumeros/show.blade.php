@extends('layouts.default')

@section('content')


<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/provincias') }}">Provincias</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="{{ URL::to('provincias/create') }}">Crear nueva provincia</a>
	</ul>
</nav>

		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">Provincia</header>
				<div class="panel-body">
					{{ Form::open(array('url' => '/provincias/' . $provincia->id, 'class' => 'panel-body wrapper-lg')) }}
					{{ Form::hidden('_method', 'DELETE') }}

						<div class="form-group">
							<label>Provincia</label>
							
							<div class="form-control input-lg">
								{{ $provincia->provincia }}
							</div><br>

						{{ Form::submit('Eliminar', array('class' => 'btn btn-warning')) }}
						{{ Form::close() }}
				</div>
			</section>
		</div>
	</div>

@stop