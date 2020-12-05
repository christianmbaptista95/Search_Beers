<%@page import="dao.DaoUsuario"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DaoProduto"%>
<%@page import="modelo.Produto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Beers - Colorado</title>
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



<%
	DaoProduto daoProduto = new DaoProduto();
List<Produto> listaProduto = new ArrayList<Produto>();

String nomePesquisaProduto = "";
nomePesquisaProduto = request.getParameter("pesquisa");

if (nomePesquisaProduto == null) {
	listaProduto = daoProduto.select();
} else {
	listaProduto = daoProduto.selectNome(nomePesquisaProduto);
}
%>



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





<body>
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

				<p>
					<img src="imagens/colorado.png" class="img-fluid" width="600"
						height="300">
				</p>


				<br> <br>
				<hr>
				<p>
					<font size="5" color="white"> A Fábrica da cervejaria
						Colorado encontra-se em Ribeirão Preto – São Paulo, sendo a
						Cervejaria Artesanal mais expressiva no cenário brasileiro. A
						Cervejaria já recebeu diversos prêmios pelos seus rótulos, como a
						Cerveja Colorado Demoiselle, que foi premiada no EuropeanBeer Star
						2008, na categoria Porter, vencendo importantes marcas europeias.
						Uma curiosidade: para produção de suas cervejas artesanais, é
						utilizado água do aquífero Guarany, uma das maiores e mais puras
						reservas de água doce do mundo. Além disso, seu malte e lúpulo são
						rigorosamente selecionados, junto com ingredientes como café,
						rapadura, mandioca, mel e castanha do Pará. </font>
				</p>
				<hr>
				<br>
				<p>
					<img id="logo-cerveja" src="imagens/colorado2.png"
						alt="Responsive image" width="600" height="350">
				</p>



				<hr>
				<br> <br>


				<form action="colorado.jsp" method="post">
					<p>
						<label for="pesquisa">Nome:</label> <input type="text"
							name="pesquisa" id="pesquisa"> <input
							class="btn btn-success btn-sm" type="submit" value="Pesquisar">
					</p>
				</form>


				<div class="container">
					<div class="row mt-5">





						<%
							for (Produto produto : listaProduto) {
						%>


						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">


								<img width="40" height="110"
									src="imagens/<%=produto.getFoto()%>">

								<div class="container">

									<a href="#" data-toggle="modal"
										data-target="#modal-cerveja-<%=produto.getId()%>"><b><%=produto.getNome()%></b></a>

								</div>
							</div>
						</div>





						<div class="modal" id="modal-cerveja-<%=produto.getId()%>">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1><%=produto.getNome()%></h1>

										<p />
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>


											Nome:
											<%=produto.getNome()%><br> Origem:
											<%=produto.getOrigem()%><br> Fabricante:<%=produto.getFabricante()%><br>
											Volume:<%=produto.getVolume()%>
											ml <br> Preço:R$
											<%=produto.getPreco()%><br> Teor Alcoólico:
											<%=produto.getTeor_alcoolico()%>


										</p>
									</div>

									<div class="modal-footer">



										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>

								</div>

							</div>


						</div>

						<%
							}
						%>




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