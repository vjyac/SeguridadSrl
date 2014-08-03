<?php

class ArticulosController extends BaseController {


	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{

        
        $articulos = DB::table('articulos')->paginate(10);
        $title = "Articulos";
        return View::make('articulos.index', array('title' => $title, 'articulos' => $articulos));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        return View::make('articulos.create');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{

		// var_dump(Input::All());
		// die;


		$rules = [
			'articulo' => 'required|unique:articulos',
			'rubros_id' => 'exists:rubros,id',
			'proveedors_id' => 'exists:proveedors,id',
			'precio_base' => 'required|numeric',
			'utilidad' => 'required|numeric',
			'precio_publico' => 'required|numeric',
			'iva' => 'required|numeric'
		];


		if (! Articulo::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Articulo::$errors);

		}

		$articulo = new Articulo;

		$articulo->articulo = Input::get('articulo');
		$articulo->rubros_id = Input::get('rubros_id');
		$articulo->proveedors_id = Input::get('proveedors_id');
		$articulo->precio_base = Input::get('precio_base');
		$articulo->utilidad = Input::get('utilidad');
		$articulo->precio_publico = Input::get('precio_publico');
		$articulo->iva = Input::get('iva');

		$articulo->save();

		return Redirect::to('/articulos');

	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{

		$articulo = Articulo::find($id);

		// show the view and pass the nerd to it
		return View::make('articulos.show')
			->with('articulo', $articulo);

	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$articulo = Articulo::find($id);
		$title = "Editar Articulo";

        return View::make('articulos.edit', array('title' => $title, 'articulo' => $articulo));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{



		$articulo = Articulo::find($id);

		$rules = [
			'articulo' => 'required|unique:articulos,articulo,' . $id,
			'rubros_id' => 'exists:rubros,id',
			'proveedors_id' => 'exists:proveedors,id',
			'precio_base' => 'required|numeric',
			'utilidad' => 'required|numeric',
			'precio_publico' => 'required|numeric',
			'iva' => 'required|numeric'
		];



		if (! Articulo::isValid(Input::all(),$rules)) {
			
			return Redirect::back()->withInput()->withErrors(Articulo::$errors);

		}


		$articulo->articulo = Input::get('articulo');
		$articulo->rubros_id = Input::get('rubros_id');
		$articulo->proveedors_id = Input::get('proveedors_id');
		$articulo->precio_base = Input::get('precio_base');
		$articulo->utilidad = Input::get('utilidad');
		$articulo->precio_publico = Input::get('precio_publico');
		$articulo->iva = Input::get('iva');

		$articulo->save();

		return Redirect::to('/articulos');


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

		
		$articulo = Articulo::find($id)->delete();

		return Redirect::to('/articulos');
	}


    public function search(){

        $term = Input::get('term');

        $articulos = DB::table('articulos')->where('articulo', 'like', '%' . $term . '%')->get();

        $adevol = array();

        if (count($articulos) > 0) {

            foreach ($articulos as $articulo)
                {
                	$precio_sin_iva = $articulo->precio_publico / (($articulo->iva / 100) + 1);

                    $adevol[] = array(
                        'id' => $articulo->id,
                        'value' => $articulo->articulo,
                        'precio' => $precio_sin_iva,
                        'iva' => $articulo->iva,
                    );
            }
        } else {
                    $adevol[] = array(
                        'id' => 0,
                        'value' => 'no hay coincidencias para: ' .  $term,
                        'precio' => 0,
                        'iva' => 0,
                    );            
        }

        return json_encode($adevol);


    }
   
    

}
