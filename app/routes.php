<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', ['as' => 'home', function () {

	return View::make('hello');

}]);


Route::get('profile', function() {

	return "Bienvenido " . Auth::user()->email;

})->before('auth');

Route::get('login','SessionsController@create');

Route::get('logout','SessionsController@destroy');

Route::resource('sessions', 'SessionsController' , ['only' => ['index', 'create', 'destroy', 'store']]);

Route::resource('users', 'UsersController');


// Provincias
Route::get( '/provincias/search', array(
    'as' => 'provincias.search',
    'uses' => 'ProvinciasController@search'
) );
Route::resource('provincias', 'ProvinciasController');


// Rubros
Route::get( '/rubros/search', array(
    'as' => 'rubros.search',
    'uses' => 'RubrosController@search'
) );
Route::resource('rubros', 'RubrosController');

// Responsabilidadesivas
Route::get( '/responsabilidadesivas/search', array(
    'as' => 'responsabilidadesivas.search',
    'uses' => 'ResponsabilidadesivasController@search'
) );

Route::resource('responsabilidadesivas', 'ResponsabilidadesivasController');


Route::resource('tiposdocumentos', 'TiposdocumentosController');

Route::resource('condicionesventas', 'CondicionesVentasController');

// Ciudads
Route::get( '/ciudads/search', array(
    'as' => 'ciudads.search',
    'uses' => 'CiudadsController@search'
) );
Route::resource('ciudads', 'CiudadsController');


// Proveedors
Route::get( '/proveedors/search', array(
    'as' => 'proveedors.search',
    'uses' => 'ProveedorsController@search'
) );
Route::resource('proveedors', 'ProveedorsController');

// Clientes
Route::get( '/clientes/search', array(
    'as' => 'clientes.search',
    'uses' => 'ClientesController@search'
) );
Route::resource('clientes', 'ClientesController');


// Clientes
Route::get( '/articulos/search', array(
    'as' => 'articulos.search',
    'uses' => 'ArticulosController@search'
) );
Route::resource('articulos', 'ArticulosController');





Route::get('ventasmovimientos/{id}/anular', 'VentasmovimientosController@anular');
Route::get('ventasmovimientos/{id}/cuerpo', 'VentasmovimientosController@cuerpo');
Route::get('ventasmovimientos/{id}/cerrar', 'VentasmovimientosController@cerrar');
Route::post('ventasmovimientos/{id}/cuerpo', 'VentasmovimientosController@cuerpo');
Route::get('ventasmovimientos/{id}/imprimirrecibo', 'VentasmovimientosController@imprimirrecibo');
Route::get('ventasmovimientoscuerpo/{id}/borrar', 'VentasmovimientoscuerposController@borrar');

Route::post( '/ctacteshow', array(
    'as' => 'ventasmovimientos.ctacteshow',
    'uses' => 'VentasmovimientosController@ctacteshow'
) );

Route::post( '/ventashow', array(
    'as' => 'ventasmovimientos.ventashow',
    'uses' => 'VentasmovimientosController@ventashow'
) );
Route::post( '/reciboshow', array(
    'as' => 'ventasmovimientos.reciboshow',
    'uses' => 'VentasmovimientosController@reciboshow'
) );
Route::post( '/mayorshow', array(
    'as' => 'ventasmovimientos.mayorshow',
    'uses' => 'VentasmovimientosController@mayorshow'
) );


Route::get('ventasmovimientos/ctactes', 'VentasmovimientosController@ctactes');
Route::get('ventasmovimientos/informeventas', 'VentasmovimientosController@informeventas');
Route::get('ventasmovimientos/informerecibos', 'VentasmovimientosController@informerecibos');
Route::get('ventasmovimientos/informemayor', 'VentasmovimientosController@informemayor');
Route::get('ventasmovimientos/ctactes', 'VentasmovimientosController@ctactes');

Route::get('/ventasmovimientos/notacredito', 'VentasmovimientosController@notacredito');
Route::get('/ventasmovimientos/notacredito/create', 'VentasmovimientosController@notacreditocreate');


Route::get('/ventasmovimientos/notacredito/{id}/edit', 'VentasmovimientosController@notacreditoedit');





Route::post( '/ventasmovimientos/verfacturasparanc', array(
		'as' => 'ventasmovimientos.verfacturasparanc',
		'uses' => 'VentasmovimientosController@verfacturasparanc'
) );

Route::post( '/ventasmovimientos/nccreate', array(
		'as' => 'ventasmovimientos.nccreate',
		'uses' => 'VentasmovimientosController@nccreate'
) );


// Route::get('/ventasmovimientos/notacredito/{id}/{fecha}/create', 'VentasmovimientosController@crearnotacredito');






Route::resource('ventasmovimientos', 'VentasmovimientosController');


Route::resource('ventasmovimientoscuerpos', 'VentasmovimientoscuerposController');

Route::get( '/recibos', array(
    'as' => 'ventasmovimientos.recibos',
    'uses' => 'VentasmovimientosController@recibos'
) );

Route::post( '/movimientossinsaldar', array(
    'as' => 'ventasmovimientos.movimientossinsaldar',
    'uses' => 'VentasmovimientosController@movimientossinsaldar'
) );

Route::post( '/movimientossinsaldarseleccion', array(
    'as' => 'ventasmovimientos.movimientossinsaldarseleccion',
    'uses' => 'VentasmovimientosController@movimientossinsaldarseleccion'
) );


Route::post( '/crearrecibos', array(
    'as' => 'ventasmovimientos.crearrecibos',
    'uses' => 'VentasmovimientosController@crearrecibos'
) );


// centro costos categorias
Route::get( '/centrocostoscategorias/search', array(
    'as' => 'centrocostoscategorias.search',
    'uses' => 'CentrocostoscategoriasController@search'
) );
// centro costos categorias
Route::get( 'centrocostoscategorias/{id}/centrocostos', array(
    'as' => 'centrocostoscategorias.centrocostos',
    'uses' => 'CentrocostoscategoriasController@centrocostos'
) );

Route::resource('centrocostoscategorias', 'CentrocostoscategoriasController');




// centro costos
Route::get( '/centrocostos/search', array(
    'as' => 'centrocostos.search',
    'uses' => 'CentrocostosController@search'
) );
// centro costos
Route::get( 'centrocostos/{id}/activar', array(
    'as' => 'centrocostos.activar',
    'uses' => 'centrocostosController@activar'
) );
Route::resource('centrocostos', 'CentrocostosController');


// centro costos categorias
Route::get( 'centrocostoscategoriasporcentrocostos/{id}', array(
    'as' => 'centrocostoscategoriasporcentrocostos.index_costos',
    'uses' => 'centrocostoscategoriasporcentrocostosController@index_costos'
) );
// centro costos categorias
Route::get( 'centrocostoscategoriasporcentrocostos/{id}/eliminar', array(
    'as' => 'centrocostoscategoriasporcentrocostos.eliminar',
    'uses' => 'centrocostoscategoriasporcentrocostosController@eliminar'
) );

Route::resource('centrocostoscategoriasporcentrocostos', 'CentrocostoscategoriasporcentrocostosController');

Route::get('comprasmovimientos/{id}/cuerpo', 'CompramovimientosController@cuerpo');
Route::get('comprasmovimientos/{id}/cerrar', 'ComprasmovimientosController@cerrar');
Route::post('comprasmovimientos/{id}/cuerpo', 'ComprasmovimientosController@cuerpo');
Route::get('comprasmovimientos/{id}/imprimirrecibo', 'ComprasmovimientosController@imprimirrecibo');
Route::get('comprasmovimientoscuerpo/{id}/borrar', 'ComprasmovimientoscuerposController@borrar');

Route::post( '/comprasctacteshow', array(
    'as' => 'comprasmovimientos.comprasctacteshow',
    'uses' => 'ComprasmovimientosController@comprasctacteshow'
) );

Route::post( '/comprashow', array(
    'as' => 'comprasmovimientos.comprashow',
    'uses' => 'ComprasmovimientosController@comprashow'
) );
Route::post( '/ordenpagoshow', array(
    'as' => 'comprasmovimientos.ordenpagoshow',
    'uses' => 'ComprasmovimientosController@ordenpagoshow'
) );
Route::post( '/compramayorshow', array(
    'as' => 'comprasmovimientos.compramayorshow',
    'uses' => 'ComprasmovimientosController@compramayorshow'
) );

Route::get('comprasmovimientos/comprasctactes', 'ComprasmovimientosController@comprasctactes');
Route::get('comprasmovimientos/informecompras', 'ComprasmovimientosController@informecompras');
Route::get('comprasmovimientos/informeordenpagos', 'ComprasmovimientosController@informeordenpagos');
Route::get('comprasmovimientos/informecompramayor', 'ComprasmovimientosController@informecompramayor');

Route::resource('comprasmovimientos', 'ComprasmovimientosController');

Route::resource('comprasmovimientoscuerpos', 'ComprasmovimientoscuerposController');

Route::get( '/ordepagoss', array(
    'as' => 'comrpasmovimientos.ordenpagos',
    'uses' => 'ComprasmovimientosController@ordenpagos'
) );

Route::post( '/movimientoscomprassinsaldar', array(
    'as' => 'comprasmovimientos.movimientoscomprassinsaldar',
    'uses' => 'ComprasmovimientosController@movimientoscomprassinsaldar'
) );

Route::post( '/movimientoscomprassinsaldarseleccion', array(
    'as' => 'comprasmovimientos.movimientoscomprassinsaldarseleccion',
    'uses' => 'ComprassmovimientosController@movimientoscomprassinsaldarseleccion'
) );

Route::post( '/crearordenpagos', array(
    'as' => 'comprasmovimientos.crearordenpagos',
    'uses' => 'ComprasmovimientosController@crearordenpagos'
) );


// centro costos categorias
Route::get( 'empresasdocumentosnumeros/search', array(
		'as' => 'empresasdocumentosnumeros.search',
		'uses' => 'EmpresasdocumentosnumerosController@search'
) );

Route::resource('empresasdocumentosnumeros', 'EmpresasdocumentosnumerosController');
