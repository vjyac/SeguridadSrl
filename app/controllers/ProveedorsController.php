<?php

class ProveedorsController extends BaseController {


	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{

        
        $proveedors = DB::table('proveedors')->paginate(10);
        $title = "Proveedores";
        return View::make('proveedors.index', array('title' => $title, 'proveedors' => $proveedors));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        return View::make('proveedors.create');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		
		$rules = [
			'proveedor' => 'required|unique:proveedors',
			'responsabilidadesivas_id' => 'exists:responsabilidadesivas,id',
			'ciudads_id' => 'exists:ciudads,id'
		];


		if (! Proveedor::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Proveedor::$errors);

		}

		$proveedor = new Proveedor;

		$proveedor->proveedor = Input::get('proveedor');
		$proveedor->cuit = Input::get('cuit');
		$proveedor->direccion = Input::get('direccion');
		$proveedor->ciudads_id = Input::get('ciudads_id');
		$proveedor->telefono = Input::get('telefono');
		$proveedor->contacto = Input::get('contacto');
		$proveedor->responsabilidadesivas_id = Input::get('responsabilidadesivas_id');
		$proveedor->centrocostos_id = 1;
		$proveedor->save();

		return Redirect::to('/proveedors');

	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{

		$proveedor = Proveedor::find($id);

		// show the view and pass the nerd to it
		return View::make('proveedors.show')
			->with('proveedor', $proveedor);

	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$proveedor = Proveedor::find($id);
		$title = "Editar proveedor";

        return View::make('proveedors.edit', array('title' => $title, 'proveedor' => $proveedor));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{

		$proveedor = Proveedor::find($id);

		$rules = [
				'proveedor' => 'required|unique:proveedors,proveedor,' . $id,
				'responsabilidadesivas_id' => 'exists:responsabilidadesivas,id',
				'ciudads_id' => 'exists:ciudads,id'
		];



		if (! Proveedor::isValid(Input::all(),$rules)) {
			
			return Redirect::back()->withInput()->withErrors(Proveedor::$errors);

		}


		$proveedor->proveedor = Input::get('proveedor');
		$proveedor->cuit = Input::get('cuit');
		$proveedor->direccion = Input::get('direccion');
		$proveedor->ciudads_id = Input::get('ciudads_id');
		$proveedor->telefono = Input::get('telefono');
		$proveedor->contacto = Input::get('contacto');
		$proveedor->responsabilidadesivas_id = Input::get('responsabilidadesivas_id');

		$proveedor->save();

		return Redirect::to('/proveedors');


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

		
		$proveedor = Proveedor::find($id)->delete();

		return Redirect::to('/proveedors');
	}


    public function search(){

        $term = Input::get('term');

        $proveedors = DB::table('proveedors')->where('proveedor', 'like', '%' . $term . '%')->get();

        $adevol = array();

        if (count($proveedors) > 0) {

            foreach ($proveedors as $proveedor)
                {
                    $adevol[] = array(
                        'id' => $proveedor->id,
                        'value' => $proveedor->proveedor,
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
