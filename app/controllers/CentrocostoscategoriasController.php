<?php

class CentrocostoscategoriasController extends BaseController {


	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{

        
        $centrocostoscategorias = DB::table('centrocostoscategorias')->paginate(10);
        $title = "Centro costos categorias";
        return View::make('centrocostoscategorias.index', array('title' => $title, 'centrocostoscategorias' => $centrocostoscategorias));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        return View::make('centrocostoscategorias.create');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		
		$rules = [
			'centrocostoscategoria' => 'required|unique:centrocostoscategorias'
		];


		if (! Centrocostoscategoria::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Centrocostoscategoria::$errors);

		}

		$centrocostoscategoria = new Centrocostoscategoria;

		$centrocostoscategoria->centrocostoscategoria = Input::get('centrocostoscategoria');

		$centrocostoscategoria->save();

		return Redirect::to('/centrocostoscategorias');

	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{


		$centrocostoscategoria = Centrocostoscategoria::find($id);

		// show the view and pass the nerd to it
		return View::make('centrocostoscategorias.show')
			->with('centrocostoscategoria', $centrocostoscategoria);

	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$centrocostoscategoria = Centrocostoscategoria::find($id);
		$title = "Editar centro costos categoria";

        return View::make('centrocostoscategorias.edit', array('title' => $title, 'centrocostoscategoria' => $centrocostoscategoria));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{

		$centrocostoscategoria = Centrocostoscategoria::find($id);

		$rules = [
				'centrocostoscategoria' => 'required|unique:centrocostoscategorias,centrocostoscategoria,' . $id			
		];



		if (! Centrocostoscategoria::isValid(Input::all(),$rules)) {
			
			return Redirect::back()->withInput()->withErrors(Centrocostoscategoria::$errors);

		}


		$centrocostoscategoria->centrocostoscategoria = Input::get('centrocostoscategoria');

		$centrocostoscategoria->save();

		return Redirect::to('/centrocostoscategorias');


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

		
		$centrocostoscategoria = Centrocostoscategoria::find($id)->delete();

		return Redirect::to('/centrocostoscategorias');
	}


    public function search(){

        $term = Input::get('term');

        $centrocostoscategorias = DB::table('centrocostoscategorias')->where('centrocostoscategoria', 'like', '%' . $term . '%')->get();

        $adevol = array();

        if (count($centrocostoscategorias) > 0) {

            foreach ($centrocostoscategorias as $centrocostoscategoria)
                {
                    $adevol[] = array(
                        'id' => $centrocostoscategoria->id,
                        'value' => $centrocostoscategoria->centrocostoscategoria,
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
   
	/**
	 * Busca los centros de costos de esa categoria
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function centrocostos($id)
	{
		
		$centrocostoscategoria = Centrocostoscategoria::find($id);

		$centrocostoscategoriasporcentrocostos = DB::table('centrocostoscategoriasporcentrocostos')->where('centrocostoscategorias_id', '=', $id)->get();

        $title = "Centro costos de esta categoria";
        return View::make('centrocostoscategoriasporcentrocostos.index', array('title' => $title,
        	'centrocostoscategoria' => $centrocostoscategoria,
        	'centrocostoscategoriasporcentrocostos' => $centrocostoscategoriasporcentrocostos,
        ));



		
	}
    

}