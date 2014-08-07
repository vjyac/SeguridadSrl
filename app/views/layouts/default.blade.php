<!DOCTYPE html>
<html lang="en" class="app">
<head>
  <meta charset="utf-8" />
  <title>Codex | Web Application</title>
  <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="stylesheet" href="/css/app.v2.css" type="text/css" />
  <link rel="stylesheet" href="/css/font.css" type="text/css" cache="false" />




</head>
<body>
<section class="hbox stretch">
  <!-- .aside -->
  <aside class="bg-dark aside-md" id="nav">
    <section class="vbox">
      <header class="header dker navbar navbar-fixed-top-xs">
        <div class="navbar-header">
          <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen" data-target="#nav"> <i class="fa fa-bars"></i>
          </a>
          <!-- <a href="/" class="navbar-brand" data-toggle="fullscreen"> -->
          <a href="/" class="navbar-brand">
            <img src="/images/logo.png" class="m-r-sm">
            <span class="hidden-nav-xs">Codex</span>
          </a>
          <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".nav-user"> <i class="fa fa-cog"></i>
          </a>
        </div>
      </header>
      <section class="w-f scrollable">
        <!-- nav -->
        <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="7px" data-railOpacity="0.2">
          <div class="clearfix wrapper bg-primary nav-user hidden-xs">
            @if (Auth::user())
            <div class="dropdown">
              <a href="/" class="dropdown-toggle" data-toggle="dropdown">
                <!--                   <span class="thumb-sm avatar pull-left m-r-sm">
                <img src="images/avatar.jpg"></span>
              -->
              <span class="hidden-nav-xs clear"></span> <strong>{{ Auth::user()->username }}</strong> <b class="caret caret-white"></b>
              <span class="text-muted text-xs block">{{ Auth::user()->email }}</span>
            </a>
          <ul class="dropdown-menu animated fadeInRight m-t-xs">
            <span class="arrow top hidden-nav-xs"></span>
            <li>
              <a href="/perfil">Perfil</a>
            </li>
            <li>
              <a href="#">
                <span class="badge bg-danger pull-right">0</span>
                Notificaciones
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="/logout">Logout</a>
            </li>
          </ul>
        </div>
        @else
        <div class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="hidden-nav-xs clear"></span> <strong>Ingresar</strong> <b class="caret caret-white"></b>
          </a>
          <ul class="dropdown-menu animated fadeInRight m-t-xs">
            <span class="arrow top hidden-nav-xs"></span>
            <li>
              <a href="/login">Login</a>
            </li>
            <li>
              <a href="/users/create">Registrarse</a>
            </li>
          </ul>
        </div>
        @endif
      </div>
      <!-- nav -->
      @if (Auth::user())
      <nav class="nav-primary hidden-xs">
        <ul class="nav">

          <li >
            <a href="#uikit" >
              <i class="fa fa-gears icon"><b class="bg-success"></b></i>
              <span class="pull-right">
                <i class="fa fa-angle-down text"></i>
                <i class="fa fa-angle-up text-active"></i>
              </span>
              <span>Configuracion</span>
            </a>
            <ul class="nav lt">
            <li >
              <a href="#table" >
                <i class="fa fa-angle-down text"></i>
                <i class="fa fa-angle-up text-active"></i>
                <span>Tablas</span>
              </a>
              <ul class="nav bg">
                <li >
                  <a href="/articulos" >
                    <i class="fa fa-angle-right"></i>
                    <span>Articulos</span>
                  </a>
                </li>
                <li >
                  <a href="/ciudads" >
                    <i class="fa fa-angle-right"></i>
                    <span>Ciudades</span>
                  </a>
                </li>
                <li >
                  <a href="/centrocostos" >
                    <i class="fa fa-angle-right"></i>
                    <span>Centro costos</span>
                  </a>
                </li>
                <li >
                  <a href="/centrocostoscategorias" >
                    <i class="fa fa-angle-right"></i>
                    <span>Centro costos categorias</span>
                  </a>
                </li>
                <li >
                  <a href="/clientes" >
                    <i class="fa fa-angle-right"></i>
                    <span>Clientes</span>
                  </a>
                </li>
                <li >
                  <a href="/condicionesventas" >
                    <i class="fa fa-angle-right"></i>
                    <span>Condiciones de Venta</span>
                  </a>
                </li>
                <li >
                  <a href="/responsabilidadesivas" >
                    <i class="fa fa-angle-right"></i>
                    <span>Responsabilidades Ivas</span>
                  </a>
                </li>
                <li >
                  <a href="/empresasdocumentosnumeros" >
                    <i class="fa fa-angle-right"></i>
                    <span>Empresas Documentos numeros</span>
                  </a>
                </li>

                <li >
                  <a href="/rubros" >
                    <i class="fa fa-angle-right"></i>
                    <span>Rubros</span>
                  </a>
                </li>
                <li >
                  <a href="/proveedors" >
                    <i class="fa fa-angle-right"></i>
                    <span>Proveedores</span>
                  </a>
                </li>

                <li >
                  <a href="/tiposdocumentos" >
                    <i class="fa fa-angle-right"></i>
                    <span>Tipos de documentos</span>
                  </a>
                </li>
                <li >
                  <a href="/provincias" >
                    <i class="fa fa-angle-right"></i>
                    <span>Provincias</span>
                  </a>
                </li>

              </ul>
            </li>

          </ul>
        </li>


            <li >
              <a href="#table" >
              <i class="fa fa-money icon"><b class="bg-success"></b></i>
                <i class="fa fa-angle-up text-active"></i>
                <span>Ventas</span>
                <i class="fa fa-angle-down text"></i>
              </a>
              <ul class="nav bg">
                <li >
                  <a href="/ventasmovimientos" >
                    <i class="fa fa-angle-right"></i>
                    <span>Facturacion</span>
                  </a>
                </li>
                <li >
                  <a href="/ventasmovimientos/notacredito" >
                    <i class="fa fa-angle-right"></i>
                    <span>Nota de credito</span>
                  </a>
                </li>

                <li >
                  <a href="/recibos" >
                    <i class="fa fa-angle-right"></i>
                    <span>Recibos</span>
                  </a>
                </li>
            <li >
              <a href="#table" >
                <i class="fa fa-angle-up text-active"></i>
                <span>Informes</span>
                <i class="fa fa-angle-down text"></i>
              </a>
              <ul class="nav bg">
                <li >
                  <a href="/ventasmovimientos/ctactes" >
                    <i class="fa fa-angle-right"></i>
                    <span>Cta Cte</span>
                  </a>
                </li>

                <li >
                  <a href="/ventasmovimientos/informeventas" >
                    <i class="fa fa-angle-right"></i>
                    <span>Ventas</span>
                  </a>
                </li>
                <li >
                  <a href="/ventasmovimientos/informerecibos" >
                    <i class="fa fa-angle-right"></i>
                    <span>Recibos</span>
                  </a>
                </li>
                <li >
                  <a href="/ventasmovimientos/informemayor" >
                    <i class="fa fa-angle-right"></i>
                    <span>Mayor cliente</span>
                  </a>
                </li>


              </ul>
            </li>


              </ul>
            </li>





            <li >
              <a href="#table" >
              <i class="fa fa-money icon"><b class="bg-success"></b></i>
                <i class="fa fa-angle-up text-active"></i>
                <span>Proveedores</span>
                <i class="fa fa-angle-down text"></i>
              </a>
              <ul class="nav bg">
                <li >
                  <a href="/comprasmovimientos" >
                    <i class="fa fa-angle-right"></i>
                    <span>Compras</span>
                  </a>
                </li>
                <li >
                  <a href="/ordenesdepagos" >
                    <i class="fa fa-angle-right"></i>
                    <span>Orden de Pago</span>
                  </a>
                </li>
                <li >
                  <a href="/comprasmovimientos/ctactes" >
                    <i class="fa fa-angle-right"></i>
                    <span>Cta Cte</span>
                  </a>
                </li>


            <li >
              <a href="#table" >
                <i class="fa fa-angle-up text-active"></i>
                <span>Informes</span>
                <i class="fa fa-angle-down text"></i>
              </a>
              <ul class="nav bg">
                <li >
                  <a href="/comprasmovimientos/informecompras" >
                    <i class="fa fa-angle-right"></i>
                    <span>Compras</span>
                  </a>
                </li>
                <li >
                  <a href="/comprasmovimientos/informeordenesdepagos" >
                    <i class="fa fa-angle-right"></i>
                    <span>Ordenes pago</span>
                  </a>
                </li>
                <li >
                  <a href="/comprasmovimientos/informemayor" >
                    <i class="fa fa-angle-right"></i>
                    <span>Mayor proveedor</span>
                  </a>
                </li>


              </ul>
            </li>


              </ul>
            </li>








      </ul>
    </nav>
    @endif
    <!-- / nav --> </div>
  <!-- / nav -->
</section>
<footer class="footer lt hidden-xs b-t b-dark">
  <div id="chat" class="dropup">
    <section class="dropdown-menu on aside-md m-l-n">
      <section class="panel bg-white">
        <header class="panel-heading b-b b-light">Active chats</header>
        <div class="panel-body animated fadeInRight">
          <p class="text-sm">No active chats.</p>
          <p>
            <a href="#" class="btn btn-sm btn-default">Start a chat</a>
          </p>
        </div>
      </section>
    </section>
  </div>
  <div id="invite" class="dropup">
    <section class="dropdown-menu on aside-md m-l-n">
      <section class="panel bg-white">
        <header class="panel-heading b-b b-light">
          John
          <i class="fa fa-circle text-success"></i>
        </header>
        <div class="panel-body animated fadeInRight">
          <p class="text-sm">No contacts in your lists.</p>
          <p>
            <a href="#" class="btn btn-sm btn-facebook">
              <i class="fa fa-fw fa-facebook"></i>
              Invite from Facebook
            </a>
          </p>
        </div>
      </section>
    </section>
  </div>
  <a href="#nav" data-toggle="class:nav-xs" class="pull-right btn btn-sm btn-dark btn-icon">
    <i class="fa fa-angle-left text"></i>
    <i class="fa fa-angle-right text-active"></i>
  </a>
  <div class="btn-group hidden-nav-xs">
    <button type="button" title="Chats" class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown" data-target="#chat">
      <i class="fa fa-comment-o"></i>
    </button>
    <button type="button" title="Contacts" class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown" data-target="#invite">
      <i class="fa fa-facebook"></i>
    </button>
  </div>
</footer>
</section>
</aside>
<!-- /.aside -->
<section id="content">
<section class="vbox">
<section>
  <section class="hbox stretch">
    <section>
      <section class="vbox">

        <section class="scrollable wrapper">
          @if (Session::get('flash_message'))
          <div class="alert alert-warning">{{ Session::get('flash_message') }}</div>
          @endif
          <div class="container">@yield('content')</div>

        </section>
        <footer class="footer bg-white b-t b-light">
          <p>http://www.codexcontrol.com</p>
        </footer>
      </section>
    </section>
    <!-- <aside class="bg-light lter b-l aside-md"></aside>
  -->
</section>
</section>
</section>
<a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
</section>
</section>
<!-- <script src="js/app.v2.js"></script> -->
<!-- Bootstrap -->
<!-- App -->
</body>
</html>
