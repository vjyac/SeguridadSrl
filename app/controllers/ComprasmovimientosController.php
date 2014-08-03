<?php

class ComprasmovimientosController extends BaseController {


	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{

        
        
        $comprasmovimientos = DB::table('comprasmovimientos')->where('estado', 'abierto')->paginate(10);
        $title = "Compras movimientos";
        return View::make('comprasmovimientos.index', array('title' => $title, 'comprasmovimientos' => $comprasmovimientos));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        return View::make('comprasmovimientos.create');
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
			'fecha' => 'required',
			'fecha_vencimiento' => 'required',
			'condicionescompras_id' => 'exists:condicionescompras,id',
			'proveedors_id' => 'exists:proveedors,id'
		];



		if (! Comprasmovimiento::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(Comprasmovimiento::$errors);

		}

		$comprasmovimiento = new Comprasmovimiento;

		$comprasmovimiento->fecha = date("Y-m-d", strtotime(Input::get('fecha')));
		$comprasmovimiento->fecha_vencimiento = date("Y-m-d", strtotime(Input::get('fecha_vencimiento')));
		$comprasmovimiento->condicionescompras_id = Input::get('condicionescompras_id');
		$comprasmovimiento->proveedors_id = Input::get('proveedors_id');
		$comprasmovimiento->tipo_movimiento = 'debe';



		$proveedor = Proveedor::find($comprasmovimiento->proveedors_id);
		$responsabilidadesiva = Responsabilidadesiva::find($proveedor->responsabilidadesivas_id);


		// Busca el proximo numero de nota de credito disponible, guarda para el nuevo recivo, y despues agrega 1 a la tabla tipo documento
		$tiposdocumento = Tiposdocumento::find($responsabilidadesiva->compra_tiposdocumentos_id);
		$numero_comprobante = Input::get('numero_comprobante');


		// hay que hacer un proceso para saber que tipo de factura le corresponde a este cliente A o B
		$comprasmovimiento->tiposdocumentos_id = $responsabilidadesiva->compra_tiposdocumentos_id;
		$comprasmovimiento->numero_comprobante = $numero_comprobante;


		$comprasmovimiento->importe_total = 0;
		$comprasmovimiento->saldo_movimiento = 0;
		$comprasmovimiento->importe_gravado = 0;
		$comprasmovimiento->importe_no_gravado = 0;
		$comprasmovimiento->importe_iva = 0;
		$comprasmovimiento->importe_otros_impuestos = 0;
		$comprasmovimiento->porcentaje_bonificacion = 0;
		$comprasmovimiento->importe_bonificacion = 0;

		$comprasmovimiento->estado = 'abierto';		

		$comprasmovimiento->users_id = Auth::user()->id;
	





		$comprasmovimiento->save();

		return Redirect::to('/comprasmovimientos');

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
		$comprasmovimiento = comprasmovimiento::find($id);
		$title = "Editar Venta Movimiento";

        return View::make('comprasmovimientos.edit', array('title' => $title, 'comprasmovimiento' => $comprasmovimiento));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{

		$comprasmovimiento = comprasmovimiento::find($id);


		$rules = [
			'fecha' => 'required',
			'fecha_vencimiento' => 'required',
			'condicionescompras_id' => 'exists:condicionescompras,id',
			'clientes_id' => 'exists:clientes,id'
		];



		if (! comprasmovimiento::isValid(Input::all(),$rules)) {

			return Redirect::back()->withInput()->withErrors(comprasmovimiento::$errors);

		}


		$comprasmovimiento->fecha = date("Y-m-d", strtotime(Input::get('fecha')));
		$comprasmovimiento->fecha_vencimiento = date("Y-m-d", strtotime(Input::get('fecha_vencimiento')));
		$comprasmovimiento->condicionescompras_id = Input::get('condicionescompras_id');
		$comprasmovimiento->clientes_id = Input::get('clientes_id');



		$comprasmovimiento->save();

		return Redirect::to('/comprasmovimientos');


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
   

	public function cuerpo($id)
	{

        $comprasmovimiento = comprasmovimiento::find($id);

        $title = "Cuerpo movimientos";
        return View::make('comprasmovimientos.show', array('title' => $title, 'comprasmovimiento' => $comprasmovimiento));

		
	}


	public function cerrar($id)
	{

		$comprasmovimiento = comprasmovimiento::find($id);


        $total =  DB::table('comprasmovimientoscuerpos')->where('comprasmovimientos_id', $id)->sum('precio_total');
        $bonificacion =  DB::table('comprasmovimientoscuerpos')->where('comprasmovimientos_id', $id)->sum('bonificacion');
        
		$importe_gravado = DB::table('comprasmovimientoscuerpos')->where('comprasmovimientos_id', $id)->sum('importe_gravado');
		$importe_no_gravado = DB::table('comprasmovimientoscuerpos')->where('comprasmovimientos_id', $id)->sum('importe_no_gravado');
		
		
		$importe_iva = DB::table('comprasmovimientoscuerpos')->where('comprasmovimientos_id', $id)->sum('importe_iva');

		$importe_otros_impuestos = DB::table('comprasmovimientoscuerpos')->where('comprasmovimientos_id', $id)->sum('importes_otros_impuestos');
		

		if ($comprasmovimiento->condicionescompras_id > 1 ) {
			$contado = false;
			$comprasmovimiento->estado = 'pendiente';
			$comprasmovimiento->saldo_movimiento = $total;
			
		} else {
			$contado = true;
			$comprasmovimiento->estado = 'cerrada';
			$comprasmovimiento->saldo_movimiento = 0;
		}

		$comprasmovimiento->importe_total = $total;

		
		$comprasmovimiento->importe_gravado = $importe_gravado;
		$comprasmovimiento->importe_no_gravado = $importe_no_gravado;
		$comprasmovimiento->importe_iva = $importe_iva;
		$comprasmovimiento->importe_otros_impuestos = $importe_otros_impuestos;
		$comprasmovimiento->porcentaje_bonificacion = 0;
		$comprasmovimiento->importe_bonificacion = $bonificacion;

		$comprasmovimiento->save();

		return Redirect::to('/comprasmovimientos');
		
	}


	public function recibos()
	{

        $title = "Recibos";
        return View::make('comprasmovimientos.recibo');
	}



	public function movimientossinsaldar()
	{


		$id = Input::get('clientes_id');


        $comprasmovimientos =  DB::table('comprasmovimientos')
        ->where('clientes_id', $id)
        ->where('saldo_movimiento', '>', 0)->paginate(10);


        $title = "Movimientos sin saldar";
        return View::make('comprasmovimientos.indexsinsaldar', array('title' => $title, 'comprasmovimientos' => $comprasmovimientos, 'id' => $id));

	}



	public function movimientossinsaldarseleccion()
	{


		$id = Input::get('clientes_id');


        $comprasmovimientos =  DB::table('comprasmovimientos')
        ->where('clientes_id', $id)
        ->where('saldo_movimiento', '>', 0)->paginate(10);


        $title = "Movimientos sin saldar";
        return View::make('comprasmovimientos.indexsinsaldar', array('title' => $title, 'comprasmovimientos' => $comprasmovimientos, 'id' => $id));

	}

    

	public function crearrecibos()
	{


		$id = Input::get('id');

		$ids = Input::get('ids');

		$importe_recibo = floatval(Input::get('importe_recibo'));

		$fecha = date("Y-m-d", strtotime(Input::get('fecha')));;

		if ($importe_recibo <= 0) {
			echo "importe = 0";
			die;
		}

		$flash_message = "";

		$importe_recibo_total = 0;
		$importe_recibo_total_observaciones = "";


        $comprasmovimientos =  DB::table('comprasmovimientos')
        ->where('clientes_id', $id)
        ->where('saldo_movimiento', '>', 0)->get();


		foreach ($comprasmovimientos as $comprasmovimiento) {
		    
			if (array_key_exists($comprasmovimiento->id, $ids)) {
			    // echo "el id " . $comprasmovimiento->id . " existe <br>";

			    if ($importe_recibo > 0 and $importe_recibo < $comprasmovimiento->saldo_movimiento) {

					$vm = comprasmovimiento::find($comprasmovimiento->id);
					$vm->saldo_movimiento = $vm->saldo_movimiento - $importe_recibo;
					$vm->save();			    	

					$importe_recibo_total += $importe_recibo;

					$tiposdocumento = Tiposdocumento::find($comprasmovimiento->tiposdocumentos_id);

					$importe_recibo_total_observaciones .= "Pago parcial " . $tiposdocumento->tiposdocumento . ": " . $comprasmovimiento->numero_comprobante . "<br> ";

			    	$importe_recibo=0;					

			    } elseif ($importe_recibo == $comprasmovimiento->saldo_movimiento) {
			    	
					$vm = comprasmovimiento::find($comprasmovimiento->id);
					$vm->saldo_movimiento = 0;
					$vm->estado = 'cerrada';
					$vm->save();			    	

					$importe_recibo_total += $importe_recibo;

					$tiposdocumento = Tiposdocumento::find($comprasmovimiento->tiposdocumentos_id);

					$importe_recibo_total_observaciones .= "Pago saldo total " . $tiposdocumento->tiposdocumento . ": " . $comprasmovimiento->numero_comprobante . "<br> ";
					
			    	
			    	$importe_recibo=0;

				} elseif ($importe_recibo > $comprasmovimiento->saldo_movimiento) {
			    	
					$vm = comprasmovimiento::find($comprasmovimiento->id);
					$vm->saldo_movimiento = 0;
					$vm->estado = 'cerrada';
					$vm->save();			    	
			    	
					$importe_recibo_total += $comprasmovimiento->saldo_movimiento;

					$tiposdocumento = Tiposdocumento::find($comprasmovimiento->tiposdocumentos_id);
					
					$importe_recibo_total_observaciones .= "Pago saldo total " . $tiposdocumento->tiposdocumento . ": " . $comprasmovimiento->numero_comprobante . "<br> ";


			    	$importe_recibo = $importe_recibo - $comprasmovimiento->saldo_movimiento;
				}


			}




		}

		// echo "Importe total del recibo a generar: " . $importe_recibo_total . "<br>";
		// echo "Observaciones: " . $importe_recibo_total_observaciones . "<br>";


		$cliente = Cliente::find($id);
		$responsabilidadesiva = Responsabilidadesiva::find($cliente->responsabilidadesivas_id);


		// Busca el proximo numero de nota de credito disponible, guarda para el nuevo recivo, y despues agrega 1 a la tabla tipo documento
		$tiposdocumento = Tiposdocumento::find($responsabilidadesiva->recibo_tiposdocumentos_id);
		$numero_comprobante = $tiposdocumento->numero_documento;
		$tiposdocumento->numero_documento = $numero_comprobante + 1;
		$tiposdocumento->save();

	



					$vm = new comprasmovimiento();
					$vm->fecha = date("Y-m-d", strtotime(Input::get('fecha')));;
					$vm->fecha_vencimiento = date("Y-m-d", strtotime(Input::get('fecha')));;
					$vm->tiposdocumentos_id = $responsabilidadesiva->recibo_tiposdocumentos_id;
					$vm->numero_comprobante = $numero_comprobante;
					$vm->tipo_movimiento = 'haber';
					$vm->importe_total = $importe_recibo_total;
					$vm->saldo_movimiento = 0;
					$vm->condicionescompras_id = 1;
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

					$vm->save();

		$flash_message .="Se creo recibo por " . $importe_recibo_total . ".<br>";
					
// Busca el proximo numero de nota de credito disponible, guarda para el nuevo recivo, y despues agrega 1 a la tabla tipo documento
	$tiposdocumento = Tiposdocumento::find($responsabilidadesiva->nc_tiposdocumentos_id);
	$numero_comprobante = $tiposdocumento->numero_documento;
	$tiposdocumento->numero_documento = $numero_comprobante + 1;
	$tiposdocumento->save();

	

		if ($importe_recibo > 0) {
					$vm = new comprasmovimiento();
					$vm->fecha = date("Y-m-d", strtotime(Input::get('fecha')));;
					$vm->fecha_vencimiento = date("Y-m-d", strtotime(Input::get('fecha')));;
					$vm->tiposdocumentos_id = $responsabilidadesiva->nc_tiposdocumentos_id;
					$vm->numero_comprobante = $numero_comprobante;
					$vm->tipo_movimiento = 'haber';
					$vm->importe_total = $importe_recibo;
					$vm->saldo_movimiento = $importe_recibo;
					$vm->condicionescompras_id = 1;
					$vm->importe_gravado = 0;
					$vm->importe_no_gravado = 0;
					$vm->importe_iva = 0;
				    $vm->importe_otros_impuestos = 0;
					$vm->porcentaje_bonificacion = 0;
					$vm->importe_bonificacion = 0;
					$vm->estado = 'abierto';
					$vm->observaciones = "Nota de debito por sobrante : " . $importe_recibo_total_observaciones;
					$vm->users_id = Auth::user()->id;
					$vm->clientes_id = $id;

					$vm->save();

					$flash_message .="Se creo Nota de credito por " . $importe_recibo . ".<br>";
		}
		

        return View::make('comprasmovimientos.recibo')->with('flash_message', $flash_message);


	}


	public function imprimirrecibo($id)
	{

        $comprasmovimiento = comprasmovimiento::find($id);

        $cliente = Cliente::find($comprasmovimiento->clientes_id);

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
		$html = '<h1>Recibo Nº: ' . str_pad($comprasmovimiento->numero_comprobante, 12, '0', STR_PAD_LEFT) . '</h1>
		Cliente: ' . $cliente->cliente . '<br>
		Fecha: ' . $comprasmovimiento->fecha . '<br>
		Importe: ' . $comprasmovimiento->importe_total . '<br>
		Detalle: ' . $comprasmovimiento->observaciones . '<br><br><br><br><br>
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
        return View::make('comprasmovimientos.ctacteshow', array('title' => $title));

	}





	public function ctacteshow()
	{

		$clientes_id = Input::get('clientes_id', 0);

		if ($clientes_id > 0) {

		        $comprasmovimientos =  DB::table('comprasmovimientos')
		        ->where('clientes_id', $clientes_id)
		        ->where('estado', 'pendiente')
		        ->where('saldo_movimiento', '>', 0)
		        ->orderBy('clientes_id', 'asc')
		        ->get();

		} else {
		        $comprasmovimientos =  DB::table('comprasmovimientos')
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

		foreach ($comprasmovimientos as $comprasmovimiento)
			{
					if ($cliente_actual<>$comprasmovimiento->clientes_id) {
						$cliente_actual = $comprasmovimiento->clientes_id;


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

					$tiposdocumento = Tiposdocumento::find($comprasmovimiento->tiposdocumentos_id);

					$html .= "<tr>";

			        $html .= "<td>" . $comprasmovimiento->fecha . "</td>";
			        $html .= "<td>" . $tiposdocumento->tiposdocumento . "</td>";
			        $html .= "<td>" . str_pad($comprasmovimiento->numero_comprobante, 12, '0', STR_PAD_LEFT) . "</td>";
			        $html .= "<td align=\"right\">" . $comprasmovimiento->saldo_movimiento . "</td>";

					$html .= "</tr>";

					$total_cliente += $comprasmovimiento->saldo_movimiento;
			    	$total_general += $comprasmovimiento->saldo_movimiento;
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



	public function informecompras()
	{

		$title = "Informe compras";
        return View::make('comprasmovimientos.comprashow', array('title' => $title));

	}




	public function comprashow()
	{

		$fecha_desde = date("Y-m-d", strtotime(Input::get('fecha_desde')));
		$fecha_hasta = date("Y-m-d", strtotime(Input::get('fecha_hasta')));


        $comprasmovimientos =  DB::table('comprasmovimientos')
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
		$pdf->SetTitle('compras entre Fechas');

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


		$html .= '<h1>Informe de compras entre fechas</h1><br>';
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




		foreach ($comprasmovimientos as $comprasmovimiento)
			{

					$cliente = Cliente::find($comprasmovimiento->clientes_id);
					$tiposdocumento = Tiposdocumento::find($comprasmovimiento->tiposdocumentos_id);

					$html .= "<tr>";

			        $html .= "<td>" . $comprasmovimiento->fecha . "</td>";
			        $html .= "<td>" . $cliente->cliente . "</td>";
			        $html .= "<td>" . $tiposdocumento->tiposdocumento . "</td>";
			        $html .= "<td>" . str_pad($comprasmovimiento->numero_comprobante, 12, '0', STR_PAD_LEFT) . "</td>";
			        $html .= "<td align=\"right\">" . $comprasmovimiento->importe_iva . "</td>";
			        $html .= "<td align=\"right\">" . $comprasmovimiento->importe_total . "</td>";

					$html .= "</tr>";

					$total_iva += $comprasmovimiento->importe_iva;
			    	$total_general += $comprasmovimiento->importe_total;
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
		$pdf->Output('informe_compras.pdf', 'I');

		//============================================================+
		// END OF FILE
		//============================================================+


		
	}




	public function informerecibos()
	{

		$title = "Informe Recibos";
        return View::make('comprasmovimientos.reciboshow', array('title' => $title));

	}




	public function reciboshow()
	{

		$fecha_desde = date("Y-m-d", strtotime(Input::get('fecha_desde')));
		$fecha_hasta = date("Y-m-d", strtotime(Input::get('fecha_hasta')));


        $comprasmovimientos =  DB::table('comprasmovimientos')
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
		$pdf->SetTitle('compras entre Fechas');

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




		foreach ($comprasmovimientos as $comprasmovimiento)
			{

					$cliente = Cliente::find($comprasmovimiento->clientes_id);
					$tiposdocumento = Tiposdocumento::find($comprasmovimiento->tiposdocumentos_id);

					$html .= "<tr>";

			        $html .= "<td>" . $comprasmovimiento->fecha . "</td>";
			        $html .= "<td>" . $cliente->cliente . "</td>";
			        $html .= "<td>" . $tiposdocumento->tiposdocumento . "</td>";
			        $html .= "<td>" . str_pad($comprasmovimiento->numero_comprobante, 12, '0', STR_PAD_LEFT) . "</td>";
			        $html .= "<td align=\"right\">" . $comprasmovimiento->importe_total . "</td>";

					$html .= "</tr>";


			    	$total_general += $comprasmovimiento->importe_total;
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
		$pdf->Output('informe_compras.pdf', 'I');

		//============================================================+
		// END OF FILE
		//============================================================+


		
	}




	public function informemayor()
	{

		$title = "Informe Mayor";
        return View::make('comprasmovimientos.mayorshow', array('title' => $title));

	}




	public function mayorshow()
	{


		$clientes_id = Input::get('clientes_id');

		$cliente = Cliente::find($clientes_id);

		$fecha_desde = date("Y-m-d", strtotime(Input::get('fecha_desde')));
		$fecha_hasta = date("Y-m-d", strtotime(Input::get('fecha_hasta')));

		$debe = DB::table('comprasmovimientos')
		->whereIn('tiposdocumentos_id', array(1,2,3,4))
		->where('clientes_id', '=', $clientes_id)
		->where('fecha', '<', $fecha_desde)
		->where('estado', 'cerrada')
		->sum('importe_total');



		$haber = DB::table('comprasmovimientos')
		->whereIn('tiposdocumentos_id', array(5))
		->where('clientes_id', '=', $clientes_id)		
		->where('fecha', '<', $fecha_desde)
		->where('estado', 'cerrada')
		->sum('importe_total');




        $comprasmovimientos =  DB::table('comprasmovimientos')
        ->whereIn('tiposdocumentos_id', array(1,2,3,4,5))
		->where('clientes_id', '=', $clientes_id)        
        ->where('fecha', '>=', $fecha_desde)
        ->where('fecha', '<=', $fecha_hasta)
        ->orderBy('fecha', 'asc')
        ->get();



		$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

		// set document information
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor('CodexControl.com');
		$pdf->SetTitle('compras entre Fechas');

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




		foreach ($comprasmovimientos as $comprasmovimiento)
			{


					if ($comprasmovimiento->fecha >= $fecha_desde and $comprasmovimiento->fecha <= $fecha_hasta) {
						$cliente = Cliente::find($comprasmovimiento->clientes_id);
						$tiposdocumento = Tiposdocumento::find($comprasmovimiento->tiposdocumentos_id);

						$html .= "<tr>";

				        $html .= "<td>" . $comprasmovimiento->fecha . "</td>";
				        $html .= "<td>" . $tiposdocumento->tiposdocumento . "</td>";
				        $html .= "<td>" . str_pad($comprasmovimiento->numero_comprobante, 12, '0', STR_PAD_LEFT) . "</td>";
				        	if ($comprasmovimiento->tipo_movimiento == "debe") {
				        		$html .= "<td align=\"right\">" . $comprasmovimiento->importe_total . "</td>";
				        		
				        		if ($comprasmovimiento->condicionescompras_id == 1) {
				        			$html .= "<td align=\"right\">" . $comprasmovimiento->importe_total . "</td>";	
				        			$saldo -= $comprasmovimiento->importe_total;	
				        		} else {
				        			$html .= "<td align=\"right\"></td>";	
				        		}

								$saldo += $comprasmovimiento->importe_total;	


				        		
				        	} else {
				        		$html .= "<td align=\"right\"></td>";
				        		$html .= "<td align=\"right\">" . $comprasmovimiento->importe_total . "</td>";
				        		$saldo -= $comprasmovimiento->importe_total;
				        		
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
		$pdf->Output('informe_compras.pdf', 'I');

		//============================================================+
		// END OF FILE
		//============================================================+


		
	}







}
