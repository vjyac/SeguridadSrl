<?php

class ClientesController extends BaseController {


	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{

        
        $clientes = DB::table('clientes')->paginate(10);
        $title = "Clientes";
        return View::make('clientes.index', array('title' => $title, 'clientes' => $clientes));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        return View::make('clientes.create');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{


		$rules = [
			'cliente' => 'required|unique:clientes',
			'responsabilidadesivas_id' => 'exists:responsabilidadesivas,id',
			'ciudads_id' => 'exists:ciudads,id'
		];


		if (! Cliente::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Cliente::$errors);

		}

		$cliente = new Cliente;

		$cliente->cliente = Input::get('cliente');
		$cliente->cuit = Input::get('cuit');
		$cliente->direccion = Input::get('direccion');
		$cliente->telefono = Input::get('telefono');
		$cliente->contacto = Input::get('contacto');
		$cliente->ciudads_id = Input::get('ciudads_id');
		$cliente->responsabilidadesivas_id = Input::get('responsabilidadesivas_id');
		$cliente->centrocostos_id = 1;
		$cliente->save();

		return Redirect::to('/clientes');

	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{

		$cliente = Cliente::find($id);

		// show the view and pass the nerd to it
		return View::make('clientes.show')
			->with('cliente', $cliente);

	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$cliente = Cliente::find($id);
		$title = "Editar cliente";

        return View::make('clientes.edit', array('title' => $title, 'cliente' => $cliente));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{

		$cliente = Cliente::find($id);

		$rules = [
				'cliente' => 'required|unique:clientes,cliente,' . $id,			
				'responsabilidadesivas_id' => 'exists:responsabilidadesivas,id',
				'ciudads_id' => 'exists:ciudads,id'

		];



		if (! Cliente::isValid(Input::all(),$rules)) {
			
			return Redirect::back()->withInput()->withErrors(Cliente::$errors);

		}


		$cliente->cliente = Input::get('cliente');
		$cliente->cuit = Input::get('cuit');
		$cliente->direccion = Input::get('direccion');
		$cliente->telefono = Input::get('telefono');
		$cliente->contacto = Input::get('contacto');
		$cliente->ciudads_id = Input::get('ciudads_id');
		$cliente->responsabilidadesivas_id = Input::get('responsabilidadesivas_id');


		$cliente->save();

		return Redirect::to('/clientes');


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

		
		$cliente = Cliente::find($id)->delete();

		return Redirect::to('/clientes');
	}


    public function search(){

        $term = Input::get('term');

        $clientes = DB::table('clientes')->where('cliente', 'like', '%' . $term . '%')->get();

        $adevol = array();

        if (count($clientes) > 0) {

            foreach ($clientes as $cliente)
                {
                    $adevol[] = array(
                        'id' => $cliente->id,
                        'value' => $cliente->cliente,
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
