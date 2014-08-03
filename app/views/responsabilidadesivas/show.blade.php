@extends('layouts.default')

@section('content')


<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/responsabilidadesivas') }}">Responsabilidadesiva</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="{{ URL::to('responsabilidadesivas/create') }}">Responsabilidadesiva</a>
	</ul>
</nav>

		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">Responsabilidadesiva</header>
				<div class="panel-body">
					{{ Form::open(array('url' => '/responsabilidadesivas/' . $responsabilidadesiva->id, 'class' => 'panel-body wrapper-lg')) }}
					{{ Form::hidden('_method', 'DELETE') }}

						<div class="form-group">
							<label>Responsabilidadesiva</label>
							
							<div class="form-control input-lg">
								{{ $responsabilidadesiva->responsabilidadesiva }}
							</div><br>

						{{ Form::submit('Eliminar', array('class' => 'btn btn-warning')) }}
						{{ Form::close() }}
				</div>
			</section>
		</div>
	</div>

<script src="/js/app.v2.js"></script>
@stop