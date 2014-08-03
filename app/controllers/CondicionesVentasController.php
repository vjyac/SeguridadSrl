<?php

class CondicionesVentasController extends BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{

        
        $condicionesventas = DB::table('condicionesventas')->paginate(10);
        $title = "Condiciones de Venta";
        return View::make('condicionesventas.index', array('title' => $title, 'condicionesventas' => $condicionesventas));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        return View::make('condicionesventas.create');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		
		$rules = [
			'condicionesventa' => 'required|unique:condicionesventas'
		];


		if (! Condicionesventa::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Condicionesventa::$errors);

		}

		$condicionesventa = new Condicionesventa;

		$condicionesventa->condicionesventa = Input::get('condicionesventa');

		$condicionesventa->save();

		return Redirect::to('/condicionesventas');

	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{

		$condicionesventa = Condicionesventa::find($id);

		// show the view and pass the nerd to it
		return View::make('condicionesventas.show')
			->with('condicionesventa', $condicionesventa);

	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$condicionesventa = Condicionesventa::find($id);
		$title = "Editar Condicion de Venta";

        return View::make('condicionesventas.edit', array('title' => $title, 'condicionesventa' => $condicionesventa));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{

		$condicionesventa = Condicionesventa::find($id);

		$rules = [
				'condicionesventa' => 'required|unique:condicionesventas,condicionesventa,' . $id			
		];



		if (! Condicionesventa::isValid(Input::all(),$rules)) {
			
			return Redirect::back()->withInput()->withErrors(Condicionesventa::$errors);

		}


		$condicionesventa->condicionesventa = Input::get('condicionesventa');

		$condicionesventa->save();

		return Redirect::to('/condicionesventas');


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

		$condicionesventa = Condicionesventa::find($id)->delete();

		return Redirect::to('/condicionesventas');
	}

}
