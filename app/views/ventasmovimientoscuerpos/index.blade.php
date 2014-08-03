<div class="row">

	<legend>Movimiento Cuerpo</legend>

	
	<?php

		$ventasmovimientoscuerpos = DB::table('ventasmovimientoscuerpos')->where('ventasmovimientos_id', "=",$id)->get();
		

		if (count($ventasmovimientoscuerpos)>0 )  {

			echo "
	<table class='table table-striped m-b-none text-sm'>
		";
			echo "
		<thead>
			<tr>
				<th><div class='text-center'>Cantidad</div></th>
				<th><div class='text-center'>Articulo</div></th>
				<th><div class='text-center'>P. Unitario</div></th>
				<th><div class='text-center'>Bonific.</div></th>
				<th><div class='text-center'>Iva</div></th>
				<th><div class='text-center'>Precio Total</div></th>
				<th>Accion</th>
			</tr>
		</thead>

		<tbody>
			";

			$precio_total_subtotal = 0;

			foreach ($ventasmovimientoscuerpos as $ventasmovimientoscuerpo)
			{
				echo "
			<tr>
				";
					
					echo "
				<td><div class='text-center'>
					";
			        echo $ventasmovimientoscuerpo->cantidad;
			        echo "
			        </div>
				</td>
				";
			        echo "
				<td>
					";

					$articulo = Articulo::find($ventasmovimientoscuerpo->articulos_id);

			        echo $articulo->articulo;
			        echo "
				</td>
				";
			        echo "
				<td><div class='text-right'>
					";			        
			        echo  $ventasmovimientoscuerpo->precio_unitario;
					echo "</div>
				</td>
				";
			        echo "
				<td><div class='text-right'>
					";
			        echo  $ventasmovimientoscuerpo->bonificacion;
			        echo "</div>
				</td>
				";
				echo "
				<td><div class='text-right'>
					";
			        echo  $ventasmovimientoscuerpo->porcentaje_iva;
			        echo "</div>
				</td>
				";				
			        echo "
				<td><div class='text-right'>
					";			        
			        echo  $ventasmovimientoscuerpo->precio_total;
			        $precio_total_subtotal = $precio_total_subtotal + $ventasmovimientoscuerpo->precio_total;
			        echo "</div>
				</td>
				";
			        echo "
				<td>
					";

					echo "<a href='/ventasmovimientoscuerpo/" . $ventasmovimientoscuerpo->id . "/borrar' class='btn btn-xs btn-success'>Borrar</a> ";

			        echo "
				</td>
				";

			    echo "
			</tr>
			";
			}





				echo "
			<tr>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td><div class='text-right'>
					";

					echo "$ " . number_format($precio_total_subtotal,2);

			        echo "</div>
				</td>
				<td>
				</td>

				";

			    echo "
			</tr>
			";




			echo "
		</tbody>
		";
			echo "
	</table>
	";



		}


	?>
</div>