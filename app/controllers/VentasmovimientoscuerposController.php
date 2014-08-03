<?php

class VentasmovimientoscuerposController extends BaseController {


	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{


        $ventasmovimientos = DB::table('ventasmovimientos')->paginate(10);
        $title = "Ventas movimientos";
        return View::make('ventasmovimientos.index', array('title' => $title, 'ventasmovimientos' => $ventasmovimientos));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        return View::make('ventasmovimientos.create');
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
			'ventasmovimientos_id' => 'exists:ventasmovimientos,id',
			'cantidad' => 'required',
			'articulos_id' => 'exists:articulos,id',
			'precio_unitario' => 'required',
			'iva' => 'required',
			'precio_total' => 'required'
		];



		if (! Ventasmovimientoscuerpo::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Ventasmovimientoscuerpo::$errors);

		}

		$ventasmovimientoscuerpo = new Ventasmovimientoscuerpo;

		$ventasmovimientoscuerpo->ventasmovimientos_id = Input::get('ventasmovimientos_id');
		$ventasmovimientoscuerpo->cantidad = Input::get('cantidad');
		$ventasmovimientoscuerpo->articulos_id = Input::get('articulos_id');
		$ventasmovimientoscuerpo->precio_unitario = Input::get('precio_unitario');
		$ventasmovimientoscuerpo->bonificacion = Input::get('bonificacion');



		$articulo = Articulo::find($ventasmovimientoscuerpo->articulos_id);

		$ventasmovimientoscuerpo->articulo = $articulo->articulo;
		$ventasmovimientoscuerpo->porcentaje_iva  = $articulo->iva;
		$ventasmovimientoscuerpo->precio_total = Input::get('precio_total') * ($articulo->iva / 100 + 1);
		$ventasmovimientoscuerpo->importe_gravado  = $ventasmovimientoscuerpo->precio_total / (($articulo->iva / 100)+1);
		$ventasmovimientoscuerpo->importe_iva = $ventasmovimientoscuerpo->precio_total - $ventasmovimientoscuerpo->importe_gravado;

	 	$ventasmovimientoscuerpo->importe_no_gravado  = 0;
	 	$ventasmovimientoscuerpo->importes_otros_impuestos  = 0;
	 	$ventasmovimientoscuerpo->porcentaje_bonificacion  = 0;
		$ventasmovimientoscuerpo->descripcion  = Input::get('descripcion','');




		$ventasmovimientoscuerpo->save();

		return Redirect::to('/ventasmovimientos/' . $ventasmovimientoscuerpo->ventasmovimientos_id . "/cuerpo");

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




	public function borrar($id)
	{

		$ventasmovimientoscuerpo = Ventasmovimientoscuerpo::find($id);

		$ventasmovimientos_id = $ventasmovimientoscuerpo->ventasmovimientos_id;

		$ventasmovimientoscuerpo->delete();


		return Redirect::to('/ventasmovimientos/' . $ventasmovimientos_id . '/cuerpo');

	}




}
