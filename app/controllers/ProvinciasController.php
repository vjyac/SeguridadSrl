<?php

class ProvinciasController extends BaseController {


	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{

        
        $provincias = DB::table('provincias')->paginate(10);
        $title = "Provincias";
        return View::make('provincias.index', array('title' => $title, 'provincias' => $provincias));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        return View::make('provincias.create');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		
		$rules = [
			'provincia' => 'required|unique:provincias'
		];


		if (! Provincia::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Provincia::$errors);

		}

		$provincia = new Provincia;

		$provincia->provincia = Input::get('provincia');

		$provincia->save();

		return Redirect::to('/provincias');

	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{


		$provincia = Provincia::find($id);

		// show the view and pass the nerd to it
		return View::make('provincias.show')
			->with('provincia', $provincia);

	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$provincia = Provincia::find($id);
		$title = "Editar provincia";

        return View::make('provincias.edit', array('title' => $title, 'provincia' => $provincia));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{

		$provincia = Provincia::find($id);

		$rules = [
				'provincia' => 'required|unique:provincias,provincia,' . $id			
		];



		if (! Provincia::isValid(Input::all(),$rules)) {
			
			return Redirect::back()->withInput()->withErrors(Provincia::$errors);

		}


		$provincia->provincia = Input::get('provincia');

		$provincia->save();

		return Redirect::to('/provincias');


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

		
		$provincia = Provincia::find($id)->delete();

		return Redirect::to('/provincias');
	}


    public function search(){

        $term = Input::get('term');

        $provincias = DB::table('provincias')->where('provincia', 'like', '%' . $term . '%')->get();

        $adevol = array();

        if (count($provincias) > 0) {

            foreach ($provincias as $provincia)
                {
                    $adevol[] = array(
                        'id' => $provincia->id,
                        'value' => $provincia->provincia,
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
