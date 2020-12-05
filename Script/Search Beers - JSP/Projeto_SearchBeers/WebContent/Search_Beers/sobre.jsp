<%@page import="dao.DaoUsuario"%>
<%@page import="modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Beers - Sobre</title>
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

				<p id="slogan">As melhores cervejas com os melhores preços..
					<br>
					<br>
			<h5>
			
			Usuário: &nbsp;<%=nomUsuarioAutenticado%> &nbsp;  | &nbsp; Código: &nbsp;<%=idUsuarioAutenticado%> &nbsp; | &nbsp; Perfil: &nbsp; <%=perfilUsuario %>
			
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



				<p>
					<img src="imagens/sobre.png" class="img-fluid"
						alt="Responsive image" width="500" height="300">
				</p>


				<h1>Como podemos melhorar sua harmotização?</h1>

				<p>
					Produtos Inovadores, Designs Criativos, armotização Extrema e
					Compromisso com Preços Honestos - <br> a Search Beers é uma
					marca com esses 4 importantes pilares que, em pouco tempo em
					operação no Brasil,<br> se tornará a marca mais amada do país
					em divulgação . Não só nos produtos, a Search Beers trabalha lado a
					lado com os amantes de cerveja,<br> e especialistas, e se
					renova todos os dias para mostrar, e atualziar o produto certo pra
					você, que também Desafia seus Limites<br> todos os dias. ​ <br>
					<br> Especificamente com foco em atender um público
					verdadeiramente apaixonado: criamos e evoluímos nossos produtos,<br>
					para garantir o máximo em satisfação e qualidade por um preço
					justo.<br> <br> <br> Alto investimento em satisfazer
					você, longa experiência e garantia de qualidade: é com isso que a
					Search Beers<br>
				</p>

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
						href="https://twitter.com/BeersSearch"><img
						class="rede_social" src="imagens/twitter.png" alt="imagem"
						width="40" height="40"></a> <a
						href="https://www.youtube.com/channel/UCOVPx0aOOn60-WZtzqgmPww"><img
						class="rede_social" src="imagens/youtube.png" alt="imagem"
						width="40" height="40"></a>

				</p>

			</div>



		</div>




	</div>

</body>
</html>