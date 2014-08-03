<?php

class RubrosController extends BaseController {


	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{

        
        $rubros = DB::table('rubros')->paginate(10);
        $title = "Rubros";
        return View::make('rubros.index', array('title' => $title, 'rubros' => $rubros));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        return View::make('rubros.create');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		
		$rules = [
			'rubro' => 'required|unique:rubros'
		];


		if (! Rubro::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Rubro::$errors);

		}

		$rubro = new Rubro;

		$rubro->rubro = Input::get('rubro');

		$rubro->save();

		return Redirect::to('/rubros');

	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{

		$rubro = Rubro::find($id);

		// show the view and pass the nerd to it
		return View::make('rubros.show')
			->with('rubro', $rubro);

	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$rubro = Rubro::find($id);
		$title = "Editar rubro";

        return View::make('rubros.edit', array('title' => $title, 'rubro' => $rubro));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{

		$rubro = Rubro::find($id);

		$rules = [
				'rubro' => 'required|unique:rubros,rubro,' . $id			
		];



		if (! Rubro::isValid(Input::all(),$rules)) {
			
			return Redirect::back()->withInput()->withErrors(Rubro::$errors);

		}


		$rubro->rubro = Input::get('rubro');

		$rubro->save();

		return Redirect::to('/rubros');


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
		
		$rubro = Rubro::find($id)->delete();

		return Redirect::to('/rubros');
	}


    public function search(){

        $term = Input::get('term');

        $rubros = DB::table('rubros')->where('rubro', 'like', '%' . $term . '%')->get();

        $adevol = array();

        if (count($rubros) > 0) {

            foreach ($rubros as $rubro)
                {
                    $adevol[] = array(
                        'id' => $rubro->id,
                        'value' => $rubro->rubro,
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
