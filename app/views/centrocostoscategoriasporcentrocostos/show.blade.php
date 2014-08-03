@extends('layouts.default')

@section('content')


<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/centrocostos') }}">Centro costos</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="{{ URL::to('/centrocostos/create') }}">Crear nuevo centro costos</a>
	</ul>
</nav>

		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">Centro costos</header>
				<div class="panel-body">
					{{ Form::open(array('url' => '/centrocostos/' . $centrocosto->id, 'class' => 'panel-body wrapper-lg')) }}
					{{ Form::hidden('_method', 'DELETE') }}

						<div class="form-group">
							<label>Centro costos</label>
							
							<div class="form-control input-lg">
								{{ $centrocosto->centrocosto }}
							</div><br>

						{{ Form::submit('Eliminar', array('class' => 'btn btn-warning')) }}
						{{ Form::close() }}
				</div>
			</section>
		</div>
	</div>

@stop