@extends('layouts.default')

@section('content')


<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="{{ URL::to('/rubros') }}">Rubro</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="{{ URL::to('rubros/create') }}">Rubro</a>
	</ul>
</nav>

		<div class="col-sm-6">
			<section class="panel panel-default">
				<header class="panel-heading font-bold">Rubro</header>
				<div class="panel-body">
					{{ Form::open(array('url' => '/rubros/' . $rubro->id, 'class' => 'panel-body wrapper-lg')) }}
					{{ Form::hidden('_method', 'DELETE') }}

						<div class="form-group">
							<label>Rubro</label>
							
							<div class="form-control input-lg">
								{{ $rubro->rubro }}
							</div><br>

						{{ Form::submit('Eliminar', array('class' => 'btn btn-warning')) }}
						{{ Form::close() }}
				</div>
			</section>
		</div>
	</div>

@stop