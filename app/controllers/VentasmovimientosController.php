<?php

class VentasmovimientosController extends BaseController {


	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{

        $ventasmovimientos = DB::table('ventasmovimientos')
															->where('estado', 'abierto')
															->whereIn('tiposdocumentos_id', array(1, 2, 3, 4, 7, 10))
															->paginate(10);
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



		// echo Input::get('tipodocumento');
		// die;
		// $input = Input::all();

		// var_dump($input);
		// die;


		$rules = [
			'fecha' => 'required',
			'fecha_vencimiento' => 'required',
			'condicionesventas_id' => 'exists:condicionesventas,id',
			'clientes_id' => 'exists:clientes,id',
			'empresas_id' => 'exists:empresas,id'
		];



		if (! Ventasmovimiento::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Ventasmovimiento::$errors);

		}


		$ventasmovimiento = new Ventasmovimiento;

		$ventasmovimiento->fecha = date("Y-m-d", strtotime(Input::get('fecha')));
		$ventasmovimiento->fecha_vencimiento = date("Y-m-d", strtotime(Input::get('fecha_vencimiento')));
		$ventasmovimiento->condicionesventas_id = Input::get('condicionesventas_id');
		$ventasmovimiento->clientes_id = Input::get('clientes_id');
		$ventasmovimiento->tipo_movimiento = 'debe';
		$ventasmovimiento->empresas_id = Input::get('empresas_id');


		// echo "id cliente: " . $ventasmovimiento->clientes_id . "<br>";
		// echo "id responsabilidadesivas_id: " . $cliente->responsabilidadesivas_id . "<br>";
		// die;

		$cliente = Cliente::find($ventasmovimiento->clientes_id);

		$responsabilidadesiva = Responsabilidadesiva::find($cliente->responsabilidadesivas_id);



		if (Input::get('tipodocumento')=="F") {

					// Busca el proximo numero de nota de credito disponible, guarda para el nuevo recivo, y despues agrega 1 a la tabla tipo documento
					$tiposdocumento = Tiposdocumento::find($responsabilidadesiva->venta_tiposdocumentos_id);
					$tiposdocumentos_id = $responsabilidadesiva->venta_tiposdocumentos_id;
					$ventasmovimiento->tiposdocumentos_id = $responsabilidadesiva->venta_tiposdocumentos_id;

		} else {
					$tiposdocumento = Tiposdocumento::find($responsabilidadesiva->nd_tiposdocumentos_id);
					$tiposdocumentos_id = $responsabilidadesiva->nd_tiposdocumentos_id;
					$ventasmovimiento->tiposdocumentos_id = $responsabilidadesiva->nd_tiposdocumentos_id;
		}


		$empresas_id = Input::get('empresas_id');

		$empresasdocumentosnumeros = DB::table('empresasdocumentosnumeros')
			->where('empresas_id', '=', $empresas_id)
			->where('tiposdocumentos_id', '=', $tiposdocumentos_id)
			->first();

		$numero_comprobante = $empresasdocumentosnumeros->numero;

		$empresasdocumentosnumeros = Empresasdocumentosnumero::find($empresasdocumentosnumeros->id);

		$empresasdocumentosnumeros->numero = $empresasdocumentosnumeros->numero + 1;
		$empresasdocumentosnumeros->save();





		// hay que hacer un proceso para saber que tipo de factura le corresponde a este cliente A o B

		$ventasmovimiento->numero_comprobante = $numero_comprobante;



		$ventasmovimiento->importe_total = 0;
		$ventasmovimiento->saldo_movimiento = 0;
		$ventasmovimiento->importe_gravado = 0;
		$ventasmovimiento->importe_no_gravado = 0;
		$ventasmovimiento->importe_iva = 0;
		$ventasmovimiento->importe_otros_impuestos = 0;
		$ventasmovimiento->porcentaje_bonificacion = 0;
		$ventasmovimiento->importe_bonificacion = 0;

		$ventasmovimiento->estado = 'abierto';

		$ventasmovimiento->users_id = Auth::user()->id;



		$ventasmovimiento->save();

		return Redirect::to('/ventasmovimientos');

	}


	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$ventasmovimiento = Ventasmovimiento::find($id);
		$title = "Editar Venta Movimiento";

        return View::make('ventasmovimientos.edit', array('title' => $title, 'ventasmovimiento' => $ventasmovimiento));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{

		$ventasmovimiento = Ventasmovimiento::find($id);


		$rules = [
			'fecha' => 'required',
			'fecha_vencimiento' => 'required',
			'condicionesventas_id' => 'exists:condicionesventas,id',
		];



		if (! Ventasmovimiento::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Ventasmovimiento::$errors);

		}


		$ventasmovimiento->fecha = date("Y-m-d", strtotime(Input::get('fecha')));
		$ventasmovimiento->fecha_vencimiento = date("Y-m-d", strtotime(Input::get('fecha_vencimiento')));
		$ventasmovimiento->condicionesventas_id = Input::get('condicionesventas_id');



		$ventasmovimiento->save();

		return Redirect::to('/ventasmovimientos');


	}



public function anular($id)
{


	$ventasmovimiento = Ventasmovimiento::find($id);
	$ventasmovimiento->estado = "cancelada";

	$ventasmovimiento->save();


				$ventasmovimientos = DB::table('ventasmovimientos')->where('estado', 'abierto')->paginate(10);
				$title = "Ventas movimientos";
				return View::make('ventasmovimientos.index', array('title' => $title, 'ventasmovimientos' => $ventasmovimientos));

}


	public function cuerpo($id)
	{

        $ventasmovimiento = Ventasmovimiento::find($id);

        $title = "Cuerpo movimientos";
        return View::make('ventasmovimientos.show', array('title' => $title, 'ventasmovimiento' => $ventasmovimiento));


	}


	public function cerrar($id)
	{

		$ventasmovimiento = Ventasmovimiento::find($id);


		$total =  DB::table('ventasmovimientoscuerpos')->where('ventasmovimientos_id', $id)->sum('precio_total');
		$bonificacion =  DB::table('ventasmovimientoscuerpos')->where('ventasmovimientos_id', $id)->sum('bonificacion');

		$importe_gravado = DB::table('ventasmovimientoscuerpos')->where('ventasmovimientos_id', $id)->sum('importe_gravado');
		$importe_no_gravado = DB::table('ventasmovimientoscuerpos')->where('ventasmovimientos_id', $id)->sum('importe_no_gravado');


		$importe_iva = DB::table('ventasmovimientoscuerpos')->where('ventasmovimientos_id', $id)->sum('importe_iva');

		$importe_otros_impuestos = DB::table('ventasmovimientoscuerpos')->where('ventasmovimientos_id', $id)->sum('importes_otros_impuestos');



		if ($ventasmovimiento->condicionesventas_id == 1 ) {
			$contado = true;
			$ventasmovimiento->estado = 'cerrada';
			$ventasmovimiento->saldo_movimiento = 0;
		} else {
			$contado = false;
			$ventasmovimiento->estado = 'pendiente';
			$ventasmovimiento->saldo_movimiento = $total;
		}

		// es una nota de credito
		if ($ventasmovimiento->tiposdocumentos_id == 6) {
			$contado = false;
			$ventasmovimiento->estado = 'pendiente';
			$ventasmovimiento->saldo_movimiento = $total;
		}


		$ventasmovimiento->importe_total = $total;


		$ventasmovimiento->importe_gravado = $importe_gravado;
		$ventasmovimiento->importe_no_gravado = $importe_no_gravado;
		$ventasmovimiento->importe_iva = $importe_iva;
		$ventasmovimiento->importe_otros_impuestos = $importe_otros_impuestos;
		$ventasmovimiento->porcentaje_bonificacion = 0;
		$ventasmovimiento->importe_bonificacion = $bonificacion;

		$ventasmovimiento->save();

		return Redirect::to('/ventasmovimientos');

	}


	public function recibos()
	{

        $title = "Recibos";
        return View::make('ventasmovimientos.recibo');
	}



	public function movimientossinsaldar()
	{

		$id = Input::get('clientes_id');


        $ventasmovimientos =  DB::table('ventasmovimientos')
        ->where('clientes_id', $id)
        ->where('saldo_movimiento', '>', 0)
				->whereIn('tiposdocumentos_id', array(1,2,3,4,6,7,9,10,11))
				->paginate(20);


        $title = "Movimientos sin saldar";
        return View::make('ventasmovimientos.indexsinsaldar', array('title' => $title, 'ventasmovimientos' => $ventasmovimientos, 'id' => $id));

	}



	public function movimientossinsaldarseleccion()
	{


		$id = Input::get('clientes_id');


        $ventasmovimientos =  DB::table('ventasmovimientos')
        ->where('clientes_id', $id)
        ->where('saldo_movimiento', '>', 0)->paginate(10);


        $title = "Movimientos sin saldar";
        return View::make('ventasmovimientos.indexsinsaldar', array('title' => $title, 'ventasmovimientos' => $ventasmovimientos, 'id' => $id));

	}



	public function crearrecibos()
	{


		$id = Input::get('id');
		$ids = Input::get('ids');

		$empresas_id = Input::get('empresas_id');

		$importe_recibo = floatval(Input::get('importe_recibo'));
		$importe_recibo_generar = floatval(Input::get('importe_recibo'));

		$fecha = date("Y-m-d", strtotime(Input::get('fecha')));;

		if ($importe_recibo < 0) {
			echo "importe < 0";
			die;
		}

		$flash_message = "";

		$importe_recibo_total = 0;
		$importe_recibo_total_observaciones = "";



		$total_facturas_a_saldar=0;
		// calcula el total de facturas a pagar !


		$ventasmovimientos =  DB::table('ventasmovimientos')
		->where('clientes_id', $id)
		->whereIn('tiposdocumentos_id', array(1,2,3,4,7,10))
		->where('saldo_movimiento', '>', 0)->get();

		foreach ($ventasmovimientos as $ventasmovimiento) {
			if (array_key_exists($ventasmovimiento->id, $ids)) {
					$total_facturas_a_saldar += $ventasmovimiento->saldo_movimiento;
			}
		}











		// suma todos los pagos a cuenta, notas de creditos y las cancela.


		$ventasmovimientos =  DB::table('ventasmovimientos')
																		->where('clientes_id', $id)
																		->whereIn('tiposdocumentos_id', array(6, 9, 11))
																		->where('saldo_movimiento', '>', 0)->get();


		foreach ($ventasmovimientos as $ventasmovimiento) {
			if (array_key_exists($ventasmovimiento->id, $ids)) {
					$importe_recibo += $ventasmovimiento->saldo_movimiento;
					$vm = Ventasmovimiento::find($ventasmovimiento->id);
					$vm->saldo_movimiento = 0;
					$vm->estado = 'cerrada';
					$vm->save();
			}
		}




        $ventasmovimientos =  DB::table('ventasmovimientos')
        ->where('clientes_id', $id)
				->whereIn('tiposdocumentos_id', array(1,2,3,4,7,10))
        ->where('saldo_movimiento', '>', 0)->get();


		foreach ($ventasmovimientos as $ventasmovimiento) {

			if (array_key_exists($ventasmovimiento->id, $ids)) {
			    // echo "el id " . $ventasmovimiento->id . " existe <br>";

			    if ($importe_recibo > 0 and $importe_recibo < $ventasmovimiento->saldo_movimiento) {

						$vm = Ventasmovimiento::find($ventasmovimiento->id);
						$vm->saldo_movimiento = $vm->saldo_movimiento - $importe_recibo;
						$vm->save();

						$importe_recibo_total += $importe_recibo;

						$tiposdocumento = Tiposdocumento::find($ventasmovimiento->tiposdocumentos_id);

						$importe_recibo_total_observaciones .= "Pago parcial " . $tiposdocumento->tiposdocumento . ": " . $ventasmovimiento->numero_comprobante . "<br> ";

						$importe_recibo=0;

			    } elseif ($importe_recibo == $ventasmovimiento->saldo_movimiento) {

					$vm = Ventasmovimiento::find($ventasmovimiento->id);
					$vm->saldo_movimiento = 0;
					$vm->estado = 'cerrada';
					$vm->save();

					$importe_recibo_total += $importe_recibo;

					$tiposdocumento = Tiposdocumento::find($ventasmovimiento->tiposdocumentos_id);

					$importe_recibo_total_observaciones .= "Pago saldo total " . $tiposdocumento->tiposdocumento . ": " . $ventasmovimiento->numero_comprobante;

					$importe_recibo=0;

				} elseif ($importe_recibo > $ventasmovimiento->saldo_movimiento) {

					$vm = Ventasmovimiento::find($ventasmovimiento->id);
					$vm->saldo_movimiento = 0;
					$vm->estado = 'cerrada';
					$vm->save();

					$importe_recibo_total += $ventasmovimiento->saldo_movimiento;

					$tiposdocumento = Tiposdocumento::find($ventasmovimiento->tiposdocumentos_id);

					$importe_recibo_total_observaciones .= "Pago saldo total " . $tiposdocumento->tiposdocumento . ": " . $ventasmovimiento->numero_comprobante;


			    	$importe_recibo = $importe_recibo - $ventasmovimiento->saldo_movimiento;
				}


			}




		}

		// echo "Importe total del recibo a generar: " . $importe_recibo_total . "<br>";
		// echo "Observaciones: " . $importe_recibo_total_observaciones . "<br>";


		$cliente = Cliente::find($id);
		$responsabilidadesiva = Responsabilidadesiva::find($cliente->responsabilidadesivas_id);


		// Busca el proximo numero de nota de credito disponible, guarda para el nuevo recivo, y despues agrega 1 a la tabla tipo documento
		$tiposdocumento = Tiposdocumento::find($responsabilidadesiva->recibo_tiposdocumentos_id);


		$numero_comprobante = Input::get('numero_comprobante');

		$vm = new Ventasmovimiento();
		$vm->fecha = date("Y-m-d", strtotime(Input::get('fecha')));;
		$vm->fecha_vencimiento = date("Y-m-d", strtotime(Input::get('fecha')));;
		$vm->tiposdocumentos_id = $responsabilidadesiva->recibo_tiposdocumentos_id;
		$vm->numero_comprobante = $numero_comprobante;
		$vm->tipo_movimiento = 'haber';
		$vm->importe_total = $importe_recibo_generar;
		$vm->saldo_movimiento = 0;
		$vm->condicionesventas_id = 1;
		$vm->importe_gravado = 0;
		$vm->importe_no_gravado = 0;
		$vm->importe_iva = 0;
		$vm->importe_otros_impuestos = 0;
		$vm->porcentaje_bonificacion = 0;
		$vm->importe_bonificacion = 0;
		$vm->estado = 'cerrada';
		$vm->observaciones = $importe_recibo_total_observaciones;
		$vm->users_id = Auth::user()->id;
		$vm->clientes_id = $id;
		$vm->empresas_id = 1;

		$vm->save();

		$flash_message .="Se creo recibo correctamente.<br>";





		if ($importe_recibo > 0) {

					// busca proximo numero de documento
					$empresasdocumentosnumeros = DB::table('empresasdocumentosnumeros')
					->where('empresas_id', '=', 1)
					->where('tiposdocumentos_id', '=', 11)
					->first();

					$numero_comprobante = $empresasdocumentosnumeros->numero;

					// suma 1 al numero de comprobante
					$empresasdocumentosnumeros = Empresasdocumentosnumero::find($empresasdocumentosnumeros->id);
					$empresasdocumentosnumeros->numero = $empresasdocumentosnumeros->numero + 1;
					$empresasdocumentosnumeros->save();


					$vm = new Ventasmovimiento();
					$vm->fecha = date("Y-m-d", strtotime(Input::get('fecha')));;
					$vm->fecha_vencimiento = date("Y-m-d", strtotime(Input::get('fecha')));;
					$vm->tiposdocumentos_id = 11;
					$vm->numero_comprobante = $numero_comprobante;
					$vm->tipo_movimiento = 'haber';
					$vm->importe_total = $importe_recibo;
					$vm->saldo_movimiento = $importe_recibo;
					$vm->condicionesventas_id = 1;
					$vm->importe_gravado = 0;
					$vm->importe_no_gravado = 0;
					$vm->importe_iva = 0;
					$vm->importe_otros_impuestos = 0;
					$vm->porcentaje_bonificacion = 0;
					$vm->importe_bonificacion = 0;
					$vm->estado = 'abierto';
					$vm->observaciones = "Pago a cuentas por : " . $importe_recibo_total_observaciones;
					$vm->users_id = Auth::user()->id;
					$vm->clientes_id = $id;
					$vm->empresas_id = $empresas_id;

					$vm->save();

					$flash_message .="Se creo pago a cuentas.<br>";
		}


        return View::make('ventasmovimientos.recibo')->with('flash_message', $flash_message);


	}


	public function imprimirrecibo($id)
	{

        $ventasmovimiento = Ventasmovimiento::find($id);

        $cliente = Cliente::find($ventasmovimiento->clientes_id);

		$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

		// set document information
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor('CodexControl.com');
		$pdf->SetTitle('Rebibo');

		// set default header data
		$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING);

		// set header and footer fonts
		$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
		$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

		// set default monospaced font
		$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

		// set margins
		$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
		$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
		$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

		// set auto page breaks
		$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

		// set image scale factor
		$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

		// set some language-dependent strings (optional)
		if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
		    require_once(dirname(__FILE__).'/lang/eng.php');
		    $pdf->setLanguageArray($l);
		}

		// ---------------------------------------------------------

		// set font
		$pdf->SetFont('dejavusans', '', 10);

		// add a page
		$pdf->AddPage();



// - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



		// writeHTML($html, $ln=true, $fill=false, $reseth=false, $cell=false, $align='')
		// writeHTMLCell($w, $h, $x, $y, $html='', $border=0, $ln=0, $fill=0, $reseth=true, $align='', $autopadding=true)

		// create some HTML content
		$html = '<h1>Recibo Nº: ' . str_pad($ventasmovimiento->numero_comprobante, 12, '0', STR_PAD_LEFT) . '</h1>
		Cliente: ' . $cliente->cliente . '<br>
		Fecha: ' . $ventasmovimiento->fecha . '<br>
		Importe: ' . $ventasmovimiento->importe_total . '<br>
		Detalle: ' . $ventasmovimiento->observaciones . '<br><br><br><br><br>
		.................................<br>
		Recibi Conforme
		';

		// output the HTML content
		$pdf->writeHTML($html, true, false, true, false, '');


		// reset pointer to the last page
		$pdf->lastPage();

		// ---------------------------------------------------------

		//Close and output PDF document
		$pdf->Output('recibo.pdf', 'I');

		//============================================================+
		// END OF FILE
		//============================================================+



	}


	public function ctactes()
	{

		$title = "Cuenta Corriente";
        return View::make('ventasmovimientos.ctacteshow', array('title' => $title));

	}





	public function ctacteshow()
	{

		$clientes_id = Input::get('clientes_id', 0);

		if ($clientes_id > 0) {

		        $ventasmovimientos =  DB::table('ventasmovimientos')
		        ->where('clientes_id', $clientes_id)
		        ->where('estado', 'pendiente')
		        ->where('saldo_movimiento', '>', 0)
		        ->orderBy('clientes_id', 'asc')
		        ->get();

		} else {
		        $ventasmovimientos =  DB::table('ventasmovimientos')
		        ->where('estado', 'pendiente')
		        ->where('saldo_movimiento', '>', 0)
		        ->orderBy('clientes_id', 'asc')
		        ->get();
		}


		$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

		// set document information
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor('CodexControl.com');
		$pdf->SetTitle('Rebibo');

		// set default header data
		$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING);

		// set header and footer fonts
		$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
		$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

		// set default monospaced font
		$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

		// set margins
		$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
		$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
		$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

		// set auto page breaks
		$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

		// set image scale factor
		$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

		// set some language-dependent strings (optional)
		if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
		    require_once(dirname(__FILE__).'/lang/eng.php');
		    $pdf->setLanguageArray($l);
		}

		// ---------------------------------------------------------

		// set font
		$pdf->SetFont('dejavusans', '', 10);

		// add a page
		$pdf->AddPage();



// - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

		$html = "";



		$cliente_actual=0;

		$total_cliente = 0;

		$total_general = 0;

		$primera_vez = true;

		foreach ($ventasmovimientos as $ventasmovimiento)
			{
					if ($cliente_actual<>$ventasmovimiento->clientes_id) {
						$cliente_actual = $ventasmovimiento->clientes_id;


						if ($primera_vez) {
							$primera_vez= false;
						} else {
							$html .= "<tr>";
					        $html .= "<td></td>";
							$html .= "<td></td>";
					        $html .= "<td align=\"right\">TOTAL CLIENTE</td>";
					        $html .= "<td align=\"right\">" . number_format($total_cliente, 2) . "</td>";
							$html .= "</tr>";

							$html .= "</table><br><br><br><br>";

							$total_cliente = 0;
						}


						$cliente = Cliente::find($cliente_actual);
						$html .= '<h3>Cliente: ' . $cliente->cliente . '</h3><br>';

						$html .= "<table>";

							$html .= "<tr>";
					        $html .= "<td>Fecha</td>";
					        $html .= "<td>Documento</td>";
					        $html .= "<td>Numero</td>";
					        $html .= "<td align=\"right\">Saldo Movimiento</td>";
							$html .= "</tr>";

					}

					$tiposdocumento = Tiposdocumento::find($ventasmovimiento->tiposdocumentos_id);

					$html .= "<tr>";

			        $html .= "<td>" . $ventasmovimiento->fecha . "</td>";
			        $html .= "<td>" . $tiposdocumento->tiposdocumento . "</td>";
			        $html .= "<td>" . str_pad($ventasmovimiento->numero_comprobante, 12, '0', STR_PAD_LEFT) . "</td>";
			        $html .= "<td align=\"right\">" . $ventasmovimiento->saldo_movimiento . "</td>";

					$html .= "</tr>";

					$total_cliente += $ventasmovimiento->saldo_movimiento;
			    	$total_general += $ventasmovimiento->saldo_movimiento;
			}

			$html .= "<tr>";
			$html .= "<td></td>";
			$html .= "<td></td>";
	        $html .= "<td align=\"right\">TOTAL CLIENTE</td>";
	        $html .= "<td align=\"right\">" . number_format($total_cliente,2) . "</td>";
			$html .= "</tr>";

			$html .= "<tr>";
			$html .= "<td></td>";
			$html .= "<td></td>";
	        $html .= "<td align=\"right\">TOTAL GENERAL</td>";
	        $html .= "<td align=\"right\">" . number_format($total_general,2) . "</td>";
			$html .= "</tr>";

			$html .= "</table><br><br><br><br>";



		// writeHTML($html, $ln=true, $fill=false, $reseth=false, $cell=false, $align='')
		// writeHTMLCell($w, $h, $x, $y, $html='', $border=0, $ln=0, $fill=0, $reseth=true, $align='', $autopadding=true)


		// output the HTML content
		$pdf->writeHTML($html, true, false, true, false, '');


		// reset pointer to the last page
		$pdf->lastPage();

		// ---------------------------------------------------------

		//Close and output PDF document
		$pdf->Output('recibo.pdf', 'I');

		//============================================================+
		// END OF FILE
		//============================================================+



	}



	public function informeventas()
	{

		$title = "Informe Ventas";
        return View::make('ventasmovimientos.ventashow', array('title' => $title));

	}




	public function ventashow()
	{

		$fecha_desde = date("Y-m-d", strtotime(Input::get('fecha_desde')));
		$fecha_hasta = date("Y-m-d", strtotime(Input::get('fecha_hasta')));


        $ventasmovimientos =  DB::table('ventasmovimientos')
        ->where('fecha', '>=', $fecha_desde)
        ->where('fecha', '<=', $fecha_hasta)
        ->whereIn('tiposdocumentos_id', array(1, 2, 3, 4))
        ->whereIn('estado', array('cerrada', 'pendiente'))
        ->orderBy('fecha', 'asc')
        ->get();


		$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

		// set document information
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor('CodexControl.com');
		$pdf->SetTitle('Ventas entre Fechas');

		// set default header data
		$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING);

		// set header and footer fonts
		$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
		$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

		// set default monospaced font
		$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

		// set margins
		$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
		$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
		$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

		// set auto page breaks
		$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

		// set image scale factor
		$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

		// set some language-dependent strings (optional)
		if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
		    require_once(dirname(__FILE__).'/lang/eng.php');
		    $pdf->setLanguageArray($l);
		}

		// ---------------------------------------------------------

		// set font
		$pdf->SetFont('dejavusans', '', 10);

		// add a page
		$pdf->AddPage();



// - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

		$html = "";



		$total_general = 0;
		$total_iva = 0;


		$html .= '<h1>Informe de ventas entre fechas</h1><br>';
		$html .= '<h3>desde: ' . $fecha_desde . ' hasta: ' . $fecha_hasta . '</h3><br>';

		$html .= "<table>";

			$html .= "<tr>";
	        $html .= "<td>Fecha</td>";
	        $html .= "<td>Cliente</td>";
	        $html .= "<td>Documento</td>";
	        $html .= "<td>Numero</td>";
	        $html .= "<td align=\"right\">Iva</td>";
	        $html .= "<td align=\"right\">Importe</td>";
			$html .= "</tr>";




		foreach ($ventasmovimientos as $ventasmovimiento)
			{

					$cliente = Cliente::find($ventasmovimiento->clientes_id);
					$tiposdocumento = Tiposdocumento::find($ventasmovimiento->tiposdocumentos_id);

					$html .= "<tr>";

			        $html .= "<td>" . $ventasmovimiento->fecha . "</td>";
			        $html .= "<td>" . $cliente->cliente . "</td>";
			        $html .= "<td>" . $tiposdocumento->tiposdocumento . "</td>";
			        $html .= "<td>" . str_pad($ventasmovimiento->numero_comprobante, 12, '0', STR_PAD_LEFT) . "</td>";
			        $html .= "<td align=\"right\">" . $ventasmovimiento->importe_iva . "</td>";
			        $html .= "<td align=\"right\">" . $ventasmovimiento->importe_total . "</td>";

					$html .= "</tr>";

					$total_iva += $ventasmovimiento->importe_iva;
			    	$total_general += $ventasmovimiento->importe_total;
			}

			$html .= "<tr>";
			$html .= "<td></td>";
			$html .= "<td></td>";
			$html .= "<td></td>";
	        $html .= "<td align=\"right\"><br></td>";
	        $html .= "<td align=\"right\"></td>";
			$html .= "</tr>";

			$html .= "<tr>";
			$html .= "<td></td>";
			$html .= "<td></td>";
			$html .= "<td></td>";
	        $html .= "<td align=\"right\">TOTAL GENERAL</td>";
	        $html .= "<td align=\"right\">" . number_format($total_iva,2) . "</td>";
	        $html .= "<td align=\"right\">" . number_format($total_general,2) . "</td>";
			$html .= "</tr>";

			$html .= "</table>";



		// writeHTML($html, $ln=true, $fill=false, $reseth=false, $cell=false, $align='')
		// writeHTMLCell($w, $h, $x, $y, $html='', $border=0, $ln=0, $fill=0, $reseth=true, $align='', $autopadding=true)


		// output the HTML content
		$pdf->writeHTML($html, true, false, true, false, '');


		// reset pointer to the last page
		$pdf->lastPage();

		// ---------------------------------------------------------

		//Close and output PDF document
		$pdf->Output('informe_ventas.pdf', 'I');

		//============================================================+
		// END OF FILE
		//============================================================+



	}




	public function informerecibos()
	{

		$title = "Informe Recibos";
        return View::make('ventasmovimientos.reciboshow', array('title' => $title));

	}




	public function reciboshow()
	{

		$fecha_desde = date("Y-m-d", strtotime(Input::get('fecha_desde')));
		$fecha_hasta = date("Y-m-d", strtotime(Input::get('fecha_hasta')));


        $ventasmovimientos =  DB::table('ventasmovimientos')
        ->where('fecha', '>=', $fecha_desde)
        ->where('fecha', '<=', $fecha_hasta)
        ->whereIn('tiposdocumentos_id', array(5))
        ->whereIn('estado', array('cerrada'))
        ->orderBy('fecha', 'asc')
        ->get();


		$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

		// set document information
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor('CodexControl.com');
		$pdf->SetTitle('Ventas entre Fechas');

		// set default header data
		$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING);

		// set header and footer fonts
		$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
		$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

		// set default monospaced font
		$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

		// set margins
		$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
		$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
		$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

		// set auto page breaks
		$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

		// set image scale factor
		$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

		// set some language-dependent strings (optional)
		if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
		    require_once(dirname(__FILE__).'/lang/eng.php');
		    $pdf->setLanguageArray($l);
		}

		// ---------------------------------------------------------

		// set font
		$pdf->SetFont('dejavusans', '', 10);

		// add a page
		$pdf->AddPage();



// - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

		$html = "";



		$total_general = 0;
		$total_iva = 0;


		$html .= '<h1>Informe de Recibos y NC entre fechas</h1><br>';
		$html .= '<h3>desde: ' . $fecha_desde . ' hasta: ' . $fecha_hasta . '</h3><br>';

		$html .= "<table>";

			$html .= "<tr>";
	        $html .= "<td>Fecha</td>";
	        $html .= "<td>Cliente</td>";
	        $html .= "<td>Documento</td>";
	        $html .= "<td>Numero</td>";
	        $html .= "<td align=\"right\">Importe</td>";
			$html .= "</tr>";




		foreach ($ventasmovimientos as $ventasmovimiento)
			{

					$cliente = Cliente::find($ventasmovimiento->clientes_id);
					$tiposdocumento = Tiposdocumento::find($ventasmovimiento->tiposdocumentos_id);

					$html .= "<tr>";

			        $html .= "<td>" . $ventasmovimiento->fecha . "</td>";
			        $html .= "<td>" . $cliente->cliente . "</td>";
			        $html .= "<td>" . $tiposdocumento->tiposdocumento . "</td>";
			        $html .= "<td>" . str_pad($ventasmovimiento->numero_comprobante, 12, '0', STR_PAD_LEFT) . "</td>";
			        $html .= "<td align=\"right\">" . $ventasmovimiento->importe_total . "</td>";

					$html .= "</tr>";


			    	$total_general += $ventasmovimiento->importe_total;
			}

			$html .= "<tr>";
			$html .= "<td></td>";
			$html .= "<td></td>";
			$html .= "<td></td>";
	        $html .= "<td align=\"right\"></td>";
			$html .= "</tr>";

			$html .= "<tr>";
			$html .= "<td></td>";
			$html .= "<td></td>";
			$html .= "<td></td>";
	        $html .= "<td align=\"right\">TOTAL GENERAL</td>";
	        $html .= "<td align=\"right\">" . number_format($total_general,2) . "</td>";
			$html .= "</tr>";

			$html .= "</table>";



		// writeHTML($html, $ln=true, $fill=false, $reseth=false, $cell=false, $align='')
		// writeHTMLCell($w, $h, $x, $y, $html='', $border=0, $ln=0, $fill=0, $reseth=true, $align='', $autopadding=true)


		// output the HTML content
		$pdf->writeHTML($html, true, false, true, false, '');


		// reset pointer to the last page
		$pdf->lastPage();

		// ---------------------------------------------------------

		//Close and output PDF document
		$pdf->Output('informe_ventas.pdf', 'I');

		//============================================================+
		// END OF FILE
		//============================================================+



	}




	public function informemayor()
	{

		$title = "Informe Mayor";
        return View::make('ventasmovimientos.mayorshow', array('title' => $title));

	}




	public function mayorshow()
	{


		$clientes_id = Input::get('clientes_id');

		$cliente = Cliente::find($clientes_id);

		$fecha_desde = date("Y-m-d", strtotime(Input::get('fecha_desde')));
		$fecha_hasta = date("Y-m-d", strtotime(Input::get('fecha_hasta')));

		$debe = DB::table('ventasmovimientos')
		->whereIn('tiposdocumentos_id', array(1,2,3,4,7,10))
		->where('clientes_id', '=', $clientes_id)
		->where('fecha', '<', $fecha_desde)
		->where('estado', 'cerrada')
		->sum('importe_total');



		$haber = DB::table('ventasmovimientos')
		->whereIn('tiposdocumentos_id', array(5,6,9))
		->where('clientes_id', '=', $clientes_id)
		->where('fecha', '<', $fecha_desde)
		->where('estado', 'cerrada')
		->sum('importe_total');




        $ventasmovimientos =  DB::table('ventasmovimientos')
        ->whereIn('tiposdocumentos_id', array(1,2,3,4,5,6,7,9,10))
		->where('clientes_id', '=', $clientes_id)
        ->where('fecha', '>=', $fecha_desde)
        ->where('fecha', '<=', $fecha_hasta)
        ->orderBy('fecha', 'asc')
        ->get();



		$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

		// set document information
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor('CodexControl.com');
		$pdf->SetTitle('Ventas entre Fechas');

		// set default header data
		$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING);

		// set header and footer fonts
		$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
		$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

		// set default monospaced font
		$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

		// set margins
		$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
		$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
		$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

		// set auto page breaks
		$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

		// set image scale factor
		$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

		// set some language-dependent strings (optional)
		if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
		    require_once(dirname(__FILE__).'/lang/eng.php');
		    $pdf->setLanguageArray($l);
		}

		// ---------------------------------------------------------

		// set font
		$pdf->SetFont('dejavusans', '', 10);

		// add a page
		$pdf->AddPage();



// - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

		$html = "";



		$saldo = $haber - $debe;



		$html .= '<h1>Informe Mayor</h1><br>';
		$html .= '<h2>Cliente: ' . $cliente->cliente . '</h2><br>';
		$html .= '<h3>desde: ' . $fecha_desde . ' hasta: ' . $fecha_hasta . '</h3><br>';

		$html .= "<table>";

			$html .= "<tr>";
	        $html .= "<td>Fecha</td>";
	        $html .= "<td>Documento</td>";
	        $html .= "<td>Numero</td>";
	        $html .= "<td align=\"right\">Debe</td>";
	        $html .= "<td align=\"right\">Haber</td>";
	        $html .= "<td align=\"right\">Saldo</td>";
			$html .= "</tr>";

			$html .= "<tr>";
	        $html .= "<td></td>";
	        $html .= "<td></td>";
	        $html .= "<td></td>";
	        $html .= "<td align=\"right\">" . number_format($debe,2) . "</td>";
	        $html .= "<td align=\"right\">" . number_format($haber,2) . "</td>";
	        $html .= "<td align=\"right\">" . number_format($saldo,2) . "</td>";
			$html .= "</tr>";




		foreach ($ventasmovimientos as $ventasmovimiento)
			{


					if ($ventasmovimiento->fecha >= $fecha_desde and $ventasmovimiento->fecha <= $fecha_hasta) {
						$cliente = Cliente::find($ventasmovimiento->clientes_id);
						$tiposdocumento = Tiposdocumento::find($ventasmovimiento->tiposdocumentos_id);

						$html .= "<tr>";

				        $html .= "<td>" . $ventasmovimiento->fecha . "</td>";
				        $html .= "<td>" . $tiposdocumento->tiposdocumento . "</td>";
				        $html .= "<td>" . str_pad($ventasmovimiento->numero_comprobante, 12, '0', STR_PAD_LEFT) . "</td>";
				        	if ($ventasmovimiento->tipo_movimiento == "debe") {
				        		$html .= "<td align=\"right\">" . $ventasmovimiento->importe_total . "</td>";

				        		if ($ventasmovimiento->condicionesventas_id == 1) {
				        			$html .= "<td align=\"right\">" . $ventasmovimiento->importe_total . "</td>";
				        			$saldo -= $ventasmovimiento->importe_total;
				        		} else {
				        			$html .= "<td align=\"right\"></td>";
				        		}

								$saldo += $ventasmovimiento->importe_total;



				        	} else {
				        		$html .= "<td align=\"right\"></td>";
				        		$html .= "<td align=\"right\">" . $ventasmovimiento->importe_total . "</td>";
				        		$saldo -= $ventasmovimiento->importe_total;

				        	}
				        $html .= "<td align=\"right\">" . number_format($saldo,2) . "</td>";

						$html .= "</tr>";
					}



			}

			$html .= "<tr>";
			$html .= "<td></td>";
			$html .= "<td></td>";
			$html .= "<td></td>";
	        $html .= "<td align=\"right\"></td>";
			$html .= "</tr>";

			$html .= "<tr>";
			$html .= "<td></td>";
			$html .= "<td></td>";
			$html .= "<td></td>";
			$html .= "<td></td>";
	        $html .= "<td align=\"right\">SALDO GENERAL</td>";
	        $html .= "<td align=\"right\">" . number_format($saldo,2) . "</td>";
			$html .= "</tr>";

			$html .= "</table>";



		// writeHTML($html, $ln=true, $fill=false, $reseth=false, $cell=false, $align='')
		// writeHTMLCell($w, $h, $x, $y, $html='', $border=0, $ln=0, $fill=0, $reseth=true, $align='', $autopadding=true)


		// output the HTML content
		$pdf->writeHTML($html, true, false, true, false, '');


		// reset pointer to the last page
		$pdf->lastPage();

		// ---------------------------------------------------------

		//Close and output PDF document
		$pdf->Output('informe_ventas.pdf', 'I');

		//============================================================+
		// END OF FILE
		//============================================================+



	}



/**
* Show the form for editing the specified resource.
*
* @param  int  $id
* @return Response
*/
public function notacredito()
{



			$ventasmovimientos = DB::table('ventasmovimientos')
														->where('estado', 'abierto')
														->whereIn('tiposdocumentos_id', array(6, 9))
														->paginate(15);

			$title = "Notas de Creditos";


			return View::make('ventasmovimientos.indexnc', array('title' => $title, 'ventasmovimientos' => $ventasmovimientos));


}





/**
* Show the form for editing the specified resource.
*
* @param  int  $id
* @return Response
*/
public function notacreditoedit($id)
{



				$ventasmovimiento = Ventasmovimiento::find($id);

				$title = "Cuerpo movimientos";
				return View::make('ventasmovimientos.show', array('title' => $title, 'ventasmovimiento' => $ventasmovimiento));



}



/**
* Show the form for editing the specified resource.
*
* @param  int  $id
* @return Response
*/
public function notacreditocreate()
{

	$title = "Nota de Credito";

			return View::make('ventasmovimientos.notacreditocreate', array('title' => $title));

}



/**
* Show the form for editing the specified resource.
*
* @param  int  $id
* @return Response
*/
public function verfacturasparanc()
{

		$rules = [
			'clientes_id' => 'exists:clientes,id',
		];

		$clientes_id = Input::get('clientes_id');
		$empresas_id = Input::get('empresas_id');


		if (! Ventasmovimiento::isValid(Input::all(),$rules)) {
					return Redirect::back()->withInput()->withErrors(Ventasmovimiento::$errors);
		}

		$cliente = Cliente::find($clientes_id);


		$ventasmovimientos = DB::table('ventasmovimientos')
																	->where('clientes_id', $clientes_id)
																	->where('empresas_id', $empresas_id)
																	->whereIn('estado', array('cerrada', 'pendiente'))
																	->whereIn('tiposdocumentos_id', array(1, 2, 3, 4, 6, 9))
																	->paginate(10);

		$title = "Facturas";
		return View::make('ventasmovimientos.indexfacturasparanc',
												array(
													'title' => $title,
													'ventasmovimientos' => $ventasmovimientos,
													'cliente' => $cliente,
													'empresas_id' => $empresas_id,

													));


}






/**
* Show the form for editing the specified resource.
*
* @param  int  $id
* @return Response
*/
public function nccreate()
{

			$rules = [
				'fecha' => 'date',
			];


			if (! Ventasmovimiento::isValid(Input::all(),$rules)) {
						return Redirect::back()->withInput()->withErrors(Ventasmovimiento::$errors);
			}


		$fecha = Input::get('fecha');


    list($dd,$mm,$yy)=explode("-",$fecha);


    $fechas = new DateTime();
		$fechas->setDate($yy, $mm, $dd);
    $fecha= $fechas->format('Y-m-d');


		$clientes_id = Input::get('clientes_id');
		$empresas_id = Input::get('empresas_id');
		$sinseleccion = Input::get('sinseleccion');
		$ventasmovimientos_id = Input::get('ventasmovimientos_id');


		$cliente = Cliente::find($clientes_id);

		$ventasmovimientoNC = new Ventasmovimiento;

		$ventasmovimientoNC->fecha = $fecha;
		$ventasmovimientoNC->fecha_vencimiento = $fecha;

		if ($cliente->responsabilidadesivas_id == 7) {
				$ventasmovimientoNC->tiposdocumentos_id = 6;
		} else {
				$ventasmovimientoNC->tiposdocumentos_id = 9;
		}

		$ventasmovimientoNC->empresas_id = $empresas_id;

		$responsabilidadesiva = Responsabilidadesiva::find($cliente->responsabilidadesivas_id);

		$tiposdocumentos_id = $responsabilidadesiva->nc_tiposdocumentos_id;

		$empresasdocumentosnumeros = DB::table('empresasdocumentosnumeros')
					->where('empresas_id', '=', $empresas_id)
					->where('tiposdocumentos_id', '=', $tiposdocumentos_id)
					->first();

		$numero_comprobante = $empresasdocumentosnumeros->numero;

		$empresasdocumentosnumeros = Empresasdocumentosnumero::find($empresasdocumentosnumeros->id);

		$empresasdocumentosnumeros->numero = $empresasdocumentosnumeros->numero + 1;
		$empresasdocumentosnumeros->save();

		$ventasmovimientoNC->numero_comprobante = $numero_comprobante;

		$ventasmovimientoNC->tipo_movimiento = "haber";
		$ventasmovimientoNC->importe_total = 0;
		$ventasmovimientoNC->saldo_movimiento = 0;
		$ventasmovimientoNC->condicionesventas_id = 1;
		$ventasmovimientoNC->importe_gravado = 0;
		$ventasmovimientoNC->importe_no_gravado = 0;
		$ventasmovimientoNC->importe_iva = 0;
		$ventasmovimientoNC->importe_otros_impuestos = 0;
		$ventasmovimientoNC->porcentaje_bonificacion = 0;
		$ventasmovimientoNC->importe_bonificacion = 0;
		$ventasmovimientoNC->estado = "abierto";
		$ventasmovimientoNC->observaciones="";
		$ventasmovimientoNC->users_id = 3;
		$ventasmovimientoNC->clientes_id = $clientes_id;

		$ventasmovimientoNC->save();

		$id_nuevo = $ventasmovimientoNC->id;



		$ventasmovimientoscuerpos = DB::table('ventasmovimientoscuerpos')
																	->where('ventasmovimientos_id', $ventasmovimientos_id)
																	->get();


		// echo count($ventasmovimientoscuerpos);
		// die;
		//
		//




		if (count($ventasmovimientoscuerpos)) {





		foreach ($ventasmovimientoscuerpos as $ventasmovimientoscuerpo)
			{


						$ventasmovimientoscuerpo_new = new Ventasmovimientoscuerpo;


						$ventasmovimientoscuerpo_new->ventasmovimientos_id = $id_nuevo;
						$ventasmovimientoscuerpo_new->cantidad = $ventasmovimientoscuerpo->cantidad;
						$ventasmovimientoscuerpo_new->articulos_id = $ventasmovimientoscuerpo->articulos_id;
						$ventasmovimientoscuerpo_new->articulo = $ventasmovimientoscuerpo->articulo;
						$ventasmovimientoscuerpo_new->importe_gravado = $ventasmovimientoscuerpo->importe_gravado;
						$ventasmovimientoscuerpo_new->importe_no_gravado = $ventasmovimientoscuerpo->importe_no_gravado;
						$ventasmovimientoscuerpo_new->importe_iva = $ventasmovimientoscuerpo->importe_iva;
						$ventasmovimientoscuerpo_new->porcentaje_iva = $ventasmovimientoscuerpo->porcentaje_iva;
						$ventasmovimientoscuerpo_new->importes_otros_impuestos = $ventasmovimientoscuerpo->importes_otros_impuestos;
						$ventasmovimientoscuerpo_new->porcentaje_bonificacion = $ventasmovimientoscuerpo->porcentaje_bonificacion;
						$ventasmovimientoscuerpo_new->precio_total = $ventasmovimientoscuerpo->precio_total;

						$ventasmovimientoscuerpo_new->save();



			}

		}

$ventasmovimientos = DB::table('ventasmovimientos')
											->where('estado', 'abierto')
											->whereIn('tiposdocumentos_id', array(6, 9))
											->paginate(15);

$title = "Notas de Creditos";

return View::make('ventasmovimientos.indexnc', array('title' => $title, 'ventasmovimientos' => $ventasmovimientos));




}





}
