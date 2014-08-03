<?php

class EmpresasdocumentosnumerosController extends BaseController {


	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{


        $empresasdocumentosnumeros = DB::table('empresasdocumentosnumeros')->paginate(30);
        $title = "Empresas documentos numeros";
        return View::make('empresasdocumentosnumeros.index', array('title' => $title, 'empresasdocumentosnumeros' => $empresasdocumentosnumeros));
	}



	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$empresasdocumentosnumero = Empresasdocumentosnumero::find($id);
		$title = "Editar empresas documentos numero";

        return View::make('empresasdocumentosnumeros.edit', array('title' => $title, 'empresasdocumentosnumero' => $empresasdocumentosnumero));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{

		$empresasdocumentosnumero = Empresasdocumentosnumero::find($id);

		$rules = [
				'numero' => 'required|numeric',
		];



		if (! Empresasdocumentosnumero::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Empresasdocumentosnumero::$errors);

		}


		$empresasdocumentosnumero->numero = Input::get('numero');

		$empresasdocumentosnumero->save();

		return Redirect::to('/empresasdocumentosnumeros');


	}




}
