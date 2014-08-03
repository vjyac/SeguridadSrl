<?php

class CentrocostosController extends BaseController {


	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{

        
        $centrocostos = DB::table('centrocostos')->paginate(10);
        $title = "Centro costos categorias";
        return View::make('centrocostos.index', array('title' => $title, 'centrocostos' => $centrocostos));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        return View::make('centrocostos.create');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		
		$rules = [
			'centrocosto' => 'required|unique:centrocostos'
		];


		if (! Centrocosto::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Centrocosto::$errors);

		}

		$centrocosto = new Centrocosto;

		$centrocosto->centrocosto = Input::get('centrocosto');

		$centrocosto->save();

		return Redirect::to('/centrocostos');

	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{


		$centrocosto = Centrocosto::find($id);

		// show the view and pass the nerd to it
		return View::make('centrocostos.show')
			->with('centrocosto', $centrocosto);

	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$centrocosto = Centrocosto::find($id);
		$title = "Editar centro costos";

        return View::make('centrocostos.edit', array('title' => $title, 'centrocosto' => $centrocosto));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{

		$centrocosto = Centrocosto::find($id);

		$rules = [
				'centrocosto' => 'required|unique:centrocostos,centrocosto,' . $id			
		];



		if (! Centrocosto::isValid(Input::all(),$rules)) {
			
			return Redirect::back()->withInput()->withErrors(Centrocosto::$errors);

		}


		$centrocosto->centrocosto = Input::get('centrocosto');

		$centrocosto->save();

		return Redirect::to('/centrocostos');


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

		$centrocosto = Centrocosto::find($id)->delete();

		return Redirect::to('/centrocostos');
	}



	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function activar($id)
	{


		$centrocosto = Centrocosto::find($id);
		$centrocosto->estado = "activo";
		$centrocosto->save();

		return Redirect::to('/centrocostos');
	}


    public function search(){

        $term = Input::get('term');

        $centrocostos = DB::table('centrocostos')->where('centrocosto', 'like', '%' . $term . '%')->get();

        $adevol = array();

        if (count($centrocostos) > 0) {

            foreach ($centrocostos as $centrocosto)
                {
                    $adevol[] = array(
                        'id' => $centrocosto->id,
                        'value' => $centrocosto->centrocosto,
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
