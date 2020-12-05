<%@page import="dao.DaoUsuario"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Produto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Beers - Inicio</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="imagens/logo.png">
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<meta charset="UTF-8">
</head>
<%@page import="dao.DaoProduto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Produto"%>
<body>


	<%
		// Verifica se o usuário está autenticado
	HttpSession sessao = request.getSession();

	String loginUsuarioAutenticado = null;
	String perfilUsuario = null;
	Usuario usuarioAutenticado = null;
	DaoUsuario dao = new DaoUsuario();

	int idUsuarioAutenticado = 0;
	String nomUsuarioAutenticado = "";
	try {
		usuarioAutenticado = (Usuario) sessao.getAttribute("usuario");
		loginUsuarioAutenticado = (String) sessao.getAttribute("login");
		perfilUsuario = (String) sessao.getAttribute("perfil");

		if (usuarioAutenticado.equals(null)) {
			response.sendRedirect("UsuarioControlador?operacao=login");
		} else {
			idUsuarioAutenticado = usuarioAutenticado.getCodigo();
			nomUsuarioAutenticado = usuarioAutenticado.getNome();
		}
	} catch (Exception e) {
		response.sendRedirect("UsuarioControlador?operacao=login");
	}
	%>

	<div id="area-cabecalho">

		<div id="area-logo">


			<img id="logo" src="imagens/logo.png" class="img-fluid">


			<p id="searchbeers">Search Beers</p>

			<p id="slogan">
				As melhores cervejas com os melhores preços.. <br> <br>
			<h5>

				Usuário: &nbsp;<%=nomUsuarioAutenticado%>
				&nbsp; | &nbsp; Código: &nbsp;<%=idUsuarioAutenticado%>
				&nbsp; | &nbsp; Perfil: &nbsp;
				<%=perfilUsuario%>

			</h5>
		</div>




		<nav class="menu">
			<ul>
				<li><a href="inicio.jsp"><img src="imagens/inicio.png"
						alt="" width="30" height="30"></a></li>




				<li><a href="colorado.jsp">Colorado</a></li>



				<li><a href="invicta.jsp">Invicta</a></li>



				<li><a href="sobre.jsp"><img src="imagens/iconesobre.png"
						alt="imagem" width="30" height="30"></a></li>

				<li><a href="contato.jsp">Contato</a></li>



				<li><a id="credencial" href="principal.jsp"><img
						src="imagens/credencial.png" alt="imagem" width="30" height="30"></a></li>


				<li><a href="../Autenticacao"><img src="imagens/sair.png"
						alt="imagem" width="30" height="30"></a></li>
			</ul>
		</nav>

		<div class="area-principal">


			<div class="postagem">






				<div class="cerveja">

					<div class="img" id="grid" class="container-fluid">

						<div class="row">

							<div id="grid1" class="col-12">
								<a href="colorado.jsp"><img id="img"
									src="imagens/colorado2.png" alt="imagem" width="200"
									height="150"></a>
								<h5>Em breve</h5>
							</div>

						</div>
					</div>
				</div>







				<div class="cerveja">

					<div class="img" id="grid" class="container-fluid">
						<div class="row">
							<div id="grid1" class="col-12">
								<a href="invicta.jsp"><img id="img"
									src="imagens/invicta.png" alt="imagem" width="200" height="150"></a>
								<h5>Em breve</h5>
							</div>
						</div>
					</div>
				</div>




				<div class="cerveja">

					<div class="img" id="grid" class="container-fluid">
						<div class="row">
							<div id="grid1" class="col-12">
								<a href="colorado.jsp"><img id="img"
									src="imagens/colorado2.png" alt="imagem" width="200"
									height="150"></a>
								<h5>Em breve</h5>

							</div>
						</div>
					</div>
				</div>
				<div class="cerveja">

					<div class="img" id="grid" class="container-fluid">
						<div class="row">
							<div id="grid1" class="col-12">
								<a href="invicta.jsp"><img id="img"
									src="imagens/invicta.png" alt="imagem" width="200" height="150"></a>
								<h5>Em breve</h5>
							</div>
						</div>
					</div>
				</div>





			</div>







		</div>
	</div>

	<div id="rodape">

		<p>
			<br>© Search Beers 2019 Todos os direitos reservados <a
				href="https://www.facebook.com/SearchBeers"><img
				class="rede_social" src="imagens/facebook.png" alt="imagem"
				width="40" height="40"></a> <a
				href="https://www.instagram.com/SearchBeers/"><img
				class="rede_social" src="imagens/instagram.png" alt="imagem"
				width="40" height="40"></a> <a
				href="https://twitter.com/BeersSearch"><img class="rede_social"
				src="imagens/twitter.png" alt="imagem" width="40" height="40"></a>
			<a href="https://www.youtube.com/channel/UCOVPx0aOOn60-WZtzqgmPww"><img
				class="rede_social" src="imagens/youtube.png" alt="imagem"
				width="40" height="40"></a>

		</p>

	</div>

	</div>

</body>
</html>