<?php

class ResponsabilidadesivasController extends BaseController {


	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{

        
        $responsabilidadesivas = DB::table('responsabilidadesivas')->paginate(10);
        $title = "Responsabilidadesivas";
        return View::make('responsabilidadesivas.index', array('title' => $title, 'responsabilidadesivas' => $responsabilidadesivas));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        return View::make('responsabilidadesivas.create');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		
		$rules = [
			'responsabilidadesiva' => 'required|unique:responsabilidadesivas'
		];


		if (! Responsabilidadesiva::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Responsabilidadesiva::$errors);

		}

		$responsabilidadesiva = new Responsabilidadesiva;

		$responsabilidadesiva->responsabilidadesiva = Input::get('responsabilidadesiva');
		$responsabilidadesiva->venta_tiposdocumentos_id = Input::get('venta_tiposdocumentos_id');
		$responsabilidadesiva->recibo_tiposdocumentos_id = Input::get('recibo_tiposdocumentos_id');
		$responsabilidadesiva->nc_tiposdocumentos_id = Input::get('nc_tiposdocumentos_id');
		$responsabilidadesiva->nd_tiposdocumentos_id = Input::get('nd_tiposdocumentos_id');


		$responsabilidadesiva->save();

		return Redirect::to('/responsabilidadesivas');

	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{

		$responsabilidadesiva = Responsabilidadesiva::find($id);

		// show the view and pass the nerd to it
		return View::make('responsabilidadesivas.show')
			->with('responsabilidadesiva', $responsabilidadesiva);

	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$responsabilidadesiva = Responsabilidadesiva::find($id);
		$title = "Editar responsabilidad iva";

        return View::make('responsabilidadesivas.edit', array('title' => $title, 'responsabilidadesiva' => $responsabilidadesiva));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{

		$responsabilidadesiva = Responsabilidadesiva::find($id);

		$rules = [
				'responsabilidadesiva' => 'required|unique:responsabilidadesivas,responsabilidadesiva,' . $id			
		];



		if (! Responsabilidadesiva::isValid(Input::all(),$rules)) {
			
			return Redirect::back()->withInput()->withErrors(Responsabilidadesiva::$errors);

		}


		$responsabilidadesiva->responsabilidadesiva = Input::get('responsabilidadesiva');
		$responsabilidadesiva->venta_tiposdocumentos_id = Input::get('venta_tiposdocumentos_id');
		$responsabilidadesiva->recibo_tiposdocumentos_id = Input::get('recibo_tiposdocumentos_id');
		$responsabilidadesiva->nc_tiposdocumentos_id = Input::get('nc_tiposdocumentos_id');
		$responsabilidadesiva->nd_tiposdocumentos_id = Input::get('nd_tiposdocumentos_id');

		$responsabilidadesiva->save();

		return Redirect::to('/responsabilidadesivas');


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

		
		$responsabilidadesiva = Responsabilidadesiva::find($id)->delete();

		return Redirect::to('/responsabilidadesivas');
	}


    public function search(){

        $term = Input::get('term');

        $responsabilidadesivas = DB::table('responsabilidadesivas')->where('responsabilidadesiva', 'like', '%' . $term . '%')->get();

        $adevol = array();

        if (count($responsabilidadesivas) > 0) {

            foreach ($responsabilidadesivas as $responsabilidadesiva)
                {
                    $adevol[] = array(
                        'id' => $responsabilidadesiva->id,
                        'value' => $responsabilidadesiva->responsabilidadesiva,
                    );
            }
        } else {
                    $adevol[] = array(
                        'id' => 0,
                        'value' => 'no hay coincidencias para ' .  $term
                    );            
        }

        return json_encode($adevol);


    }
   
   
}
