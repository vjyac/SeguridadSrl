<?php

class TiposdocumentosController extends BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
        $tiposdocumentos = DB::table('tiposdocumentos')->paginate(10);
        $title = "Tipos Documentos";
        return View::make('tiposdocumentos.index', array('title' => $title, 'tiposdocumentos' => $tiposdocumentos));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        return View::make('tiposdocumentos.create');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		
		$rules = [
			'tiposdocumento' => 'required|unique:tiposdocumentos'
		];


		if (! Tiposdocumento::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Tiposdocumento::$errors);

		}

		$tiposdocumento = new Tiposdocumento;

		$tiposdocumento->tiposdocumento = Input::get('tiposdocumento');

		$tiposdocumento->save();

		return Redirect::to('/tiposdocumentos');

	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{

		$tiposdocumento = Tiposdocumento::find($id);

		// show the view and pass the nerd to it
		return View::make('tiposdocumentos.show')
			->with('tiposdocumento', $tiposdocumento);

	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$tiposdocumento = Tiposdocumento::find($id);
		$title = "Editar Tipo Documento";

        return View::make('tiposdocumentos.edit', array('title' => $title, 'tiposdocumento' => $tiposdocumento));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{

		$tiposdocumento = Tiposdocumento::find($id);

		$rules = [
				'tiposdocumento' => 'required|unique:tiposdocumentos,tiposdocumento,' . $id			
		];



		if (! Tiposdocumento::isValid(Input::all(),$rules)) {
			
			return Redirect::back()->withInput()->withErrors(Tiposdocumento::$errors);

		}


		$tiposdocumento->tiposdocumento = Input::get('tiposdocumento');

		$tiposdocumento->save();

		return Redirect::to('/tiposdocumentos');

	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$input = Input::all();		
		
		$tiposdocumento = Tiposdocumento::find($id)->delete();

		return Redirect::to('/tiposdocumentos');
	}

}
