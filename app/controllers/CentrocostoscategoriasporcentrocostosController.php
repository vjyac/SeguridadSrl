<?php

class CentrocostoscategoriasporcentrocostosController extends BaseController {


	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index_costos($id)
	{
		$centrocostos = Centrocosto::find($id);
        $centrocostoscategoriasporcentrocostos = DB::table('centrocostoscategoriasporcentrocostos')->where('centrocostos_id', '=', $id)->get();
        $title = "Centros de costos";
        return View::make('centrocostoscategoriasporcentrocostos.index',
        		array('title' => $title,
        			  'centrocostoscategoriasporcentrocostos' => $centrocostoscategoriasporcentrocostos,
        			  'centrocostos' => $centrocostos
        		));
	}



	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{

		// $input = Input::all();		
		// var_dump($input);
		// die;
		

		$rules = [
			'centrocostos_id' => 'exists:centrocostos,id',
			'centrocostoscategorias_id' => 'exists:centrocostoscategorias,id',
		];


		if (! Centrocostoscategoriasporcentrocosto::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Centrocostoscategoriasporcentrocosto::$errors);

		}


		$centrocostoscategoriasporcentrocosto = new Centrocostoscategoriasporcentrocosto;

		$centrocostoscategoriasporcentrocosto->centrocostos_id = Input::get('centrocostos_id');
		$centrocostoscategoriasporcentrocosto->centrocostoscategorias_id = Input::get('centrocostoscategorias_id');
		$centrocostoscategoriasporcentrocosto->porcentaje = Input::get('porcentaje');

		$centrocostoscategoriasporcentrocosto->save();
		$this->cambiar_estado($centrocostoscategoriasporcentrocosto->centrocostos_id, "inactivo");

		return Redirect::to('/centrocostoscategoriasporcentrocostos/' . $centrocostoscategoriasporcentrocosto->centrocostos_id);

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
	public function eliminar($id)
	{


		$centrocostoscategoriasporcentrocosto = Centrocostoscategoriasporcentrocosto::find($id);
		$centrocostos_id = $centrocostoscategoriasporcentrocosto->centrocostos_id;
		$centrocostoscategoriasporcentrocosto = Centrocostoscategoriasporcentrocosto::find($id)->delete();
		$this->cambiar_estado($centrocostos_id, "inactivo");
		return Redirect::to('/centrocostoscategoriasporcentrocostos/' . $centrocostos_id);
	}



	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function cambiar_estado($centrocostos_id, $estado)
	{


		$centrocosto = Centrocosto::find($centrocostos_id);

		$centrocosto->estado = $estado;
		$centrocosto->save();

		return true;
	}


    

}
