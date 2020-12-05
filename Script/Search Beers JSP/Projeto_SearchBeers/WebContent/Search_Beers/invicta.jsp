<%@page import="modelo.Usuario"%>
<%@page import="dao.DaoUsuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Beers - Invicta</title>
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
					<img src="imagens/invicta.png" class="img-fluid" width="500"
						height="300">
				</p>

				<hr>

				<p>
					<font size="5" color="white"> A história da Cervejaria
						Invicta começa em Ribeirão Preto, interior de São Paulo em 2011. <br>Fundada
						pelo Mestre cervejeiro Rodrigo Silveira para apreciadores de boas
						cervejas artesanais que gostam de degustar e harmonizar a bebida
						com alguns pratos. <br>Apesar de concorrer com todas as
						marcas de cerveja, a Cervejaria Invicta aposta num nicho de
						mercado específico, voltado a um público seleto.
					</font>
				</p>

				<hr>

				<br>


				<p>
					<img id="logo-cerveja" src="imagens/invicta2.png" class="img-fluid" width="550"
						height="600">
				</p>

				<hr>

				<br>

				<p>

					<label for="pesquisa">Cerveja:</label> <input type="text"
						name="pesquisa" id="pesquisa"> <input
						class="btn btn-success btn-sm" type="submit" value="Pesquisar">
				</p>

				<br>

				<div class="container">

					<div class="row mt-5">




						<!--  Cerveja Invicta 2 Cabeças Maracujipa -->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">



								<img src="imagens/invicta-2cabeças-maracujipa.png"
									alt="maracujipa" width="40" height="110">

								<div class="container">

									<a href="#" data-toggle="modal"
										data-target="#modal-2cabecas-maracujipa"><b>Invicta 2
											cabeças maracujipa</b> </a>
								</div>

							</div>

						</div>

						<div class="modal" id="modal-2cabecas-maracujipa">

							<div class="modal-dialog modal-dialog-scrollable">

								<div class="modal-content">

									<div class="modal-header">

										<p>
										<h1>Cerveja Invicta 2 cabeças maracujipa</h1>

										<p />

										<button type="button" class="close" data-dismiss="modal">&times;</button>

									</div>


									<div class="modal-body">

										<p>

											Invicta 2 cabeças maracujipa <br> Origem: Ribeirão Preto
											- SP<br> Cervejaria: Invicta <br> Volume: 500ml <br>
											Preços: R$18,00<br> Teor Alcoólico: 5%

										</p>

									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>


								</div>

							</div>

						</div>

						<!--  Cerveja Invicta 2 Cabeças Maracujipa -->




						<!--  Cerveja Invicta 2 Cabeças Zezinho -->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">



								<img src="imagens/invicta-2cabeças-zézinho.png"
									alt="2-cabecas-zezinho" width="40" height="110">

								<div class="container">

									<a href="#" data-toggle="modal"
										data-target="#modal-2cabecas-zezinho"><b>Invicta 2
											cabeças de zézinho</b> </a>
								</div>

							</div>

						</div>

						<div class="modal" id="modal-2cabecas-zezinho">

							<div class="modal-dialog modal-dialog-scrollable">

								<div class="modal-content">

									<div class="modal-header">

										<p>
										<h1>Cerveja Invicta 2 cabeças de zézinho</h1>

										<p />

										<button type="button" class="close" data-dismiss="modal">&times;</button>

									</div>


									<div class="modal-body">

										<p>

											Invicta 2 cabeças de zézinho <br> Origem: Ribeirão Preto
											- SP<br> Cervejaria: Invicta <br> Volume: 500ml <br>
											Preços: R$ 22,90<br> Teor Alcoólico: 5 %

										</p>

									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>

								</div>

							</div>

						</div>

						<!--  Cerveja Invicta 2 Cabeças Zezinho -->







						<!--  Cerveja Invicta 6 O Clock -->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">



								<img src="imagens/invicta-6-o-clock.png" alt="6oclock"
									width="40" height="110">

								<div class="container">

									<a href="#" data-toggle="modal" data-target="#modal-6oclock"><b>Invicta
											6 Oclock</b> </a>
								</div>

							</div>

						</div>

						<div class="modal" id="modal-6oclock">

							<div class="modal-dialog modal-dialog-scrollable">

								<div class="modal-content">

									<div class="modal-header">

										<p>
										<h1>Cerveja Invicta 6 Oclock</h1>

										<p />

										<button type="button" class="close" data-dismiss="modal">&times;</button>

									</div>


									<div class="modal-body">

										<p>

											Invicta 6 Oclock <br> Origem: Ribeirão Preto - SP<br>
											Cervejaria: Invicta<br> Volume: 600ml <br> Preços:
											R$16,90<br> Teor Alcoólico: 5.8 %

										</p>

									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>


								</div>

							</div>

						</div>

						<!--  Cerveja Invicta 6 O Clock -->





						<!--  Cerveja Colorado 007 -->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">

								<img src="imagens/invicta-007.png" alt="007" width="40"
									height="110">


								<div class="container">

									<a href="#" data-toggle="modal" data-target="#modal-007"><b>
											Invicta 007 </b> </a>
								</div>

							</div>

						</div>


						<div class="modal" id="modal-007">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1>Cerveja Invicta 007</h1>

										<p />
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>
											Invicta 007<br> Origem: Ribeirão Preto - SP<br>
											Cervejaria: Invicta<br> Volume: 500ml <br> Preços:
											R$26,90<br> Teor Alcoólico: 7 %
										</p>
									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>


								</div>

							</div>

						</div>

						<!--  Cerveja Invicta  007-->







						<!--  Cerveja Invicta 1000 IBU -->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">

								<img src="imagens/invicta-1000-ibu.png" alt="1000ibu" width="40"
									height="110">


								<div class="container">

									<a href="#" data-toggle="modal" data-target="#modal-1000ibu"><b>
											Invicta 1000 IBU </b> </a>
								</div>

							</div>

						</div>


						<div class="modal" id="modal-1000ibu">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1>Cerveja Invicta 1000 IBU</h1>

										<p />
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>
											Invicta 1000 IBU<br> Origem: Ribeirão Preto - SP<br>
											Cervejaria: Invicta<br> Volume: 500ml <br> Preços:
											R$34,90<br> Teor Alcoólico: 8.0 %
										</p>
									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>


								</div>

							</div>

						</div>

						<!--  Cerveja Invicta 1000 IBU -->






						<!--  Cerveja Invicta 1000 IBU Jacu -->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">

								<img src="imagens/invicta-1000-ibu-jacu.png" alt="1000-ibu-jacu"
									width="40" height="110">


								<div class="container">

									<a href="#" data-toggle="modal"
										data-target="#modal-1000ibujacu"><b> Invicta 1000 IBU
											Jacu</b> </a>
								</div>

							</div>

						</div>


						<div class="modal" id="modal-1000ibujacu">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1>Cerveja Invicta 1000 IBU Jacu</h1>

										<p />
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>
											Invicta 1000 ibu jacu<br> Origem: Ribeirão Preto - SP<br>
											Cervejaria: Invicta <br> Volume: 500ml <br> Preços:
											R$25,99<br> Teor Alcoólico: 4 %
										</p>
									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>


								</div>

							</div>

						</div>

						<!--  Cerveja Invicta 1000 IBU Jacu -->




					</div>




					<div class="row mt-5">





						<!--  Cerveja Invicta Boss-->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">

								<img src="imagens/invicta-boss.png" alt="boss" width="40"
									height="110">


								<div class="container">

									<a href="#" data-toggle="modal" data-target="#modal-boss"><b>
											Invicta Boss</b> </a>
								</div>

							</div>

						</div>


						<div class="modal" id="modal-boss">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1>Cerveja Invicta Boss</h1>

										<p />
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>
											Invicta Boss<br> Origem: Ribeirão Preto - SP<br>
											Cervejaria: Invicta <br> Volume: 500ml <br> Preços:
											R$25,99<br> Teor Alcoólico: 10 %
										</p>
									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>


								</div>
							</div>
						</div>

						<!--  Cerveja Invicta Boss-->






						<!--  Cerveja Invicta Damiana -->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">

								<img src="imagens/invicta-damiana.png" alt="damiana" width="40"
									height="110">


								<div class="container">

									<a href="#" data-toggle="modal" data-target="#modal-damiana"><b>
											Invicta Damiana </b> </a>
								</div>

							</div>

						</div>


						<div class="modal" id="modal-damiana">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1>Cerveja Invicta Damiana</h1>

										<p />
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>
											Invicta Damiana<br> Origem: Ribeirão Preto - SP<br>
											Cervejaria: Invicta<br> Volume: 500ml <br> Preços:
											R$19,90<br> Teor Alcoólico: 5.5 %
										</p>
									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>


								</div>

							</div>

						</div>

						<!--  Cerveja Invicta Damiana-->








						<!--  Cerveja Invicta God Of Thunder  -->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">

								<img src="imagens/invicta-god-of-thunder.png" alt="godofthunder"
									width="40" height="110">

								<div class="container">

									<a href="#" data-toggle="modal"
										data-target="#modal-godofthunder"><b> Invicta God Of
											Thunder </b> </a>
								</div>

							</div>

						</div>


						<div class="modal" id="modal-godofthunder">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1>Cerveja Invicta God Of Thunder</h1>

										<p />
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>
											Invicta God Of Thunder <br> Origem: Ribeirão Preto - SP<br>
											Cervejaria: Invicta <br> Volume: 500ml <br> Preços:
											R$22,99<br> Teor Alcoólico: 4 %
										</p>
									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>


								</div>

							</div>

						</div>

						<!--  Cerveja Invicta God Of Thunder -->






						<!--  Cerveja Invicta HellRibeirão Pils -->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">

								<img src="imagens/invicta-hellbeirão.png" alt="hellribeirao"
									width="40" height="110">


								<div class="container">

									<a href="#" data-toggle="modal"
										data-target="#modal-hellribeirao"><b>Invicta
											HellRibeirão </b> </a>
								</div>

							</div>

						</div>


						<div class="modal" id="modal-hellribeirao">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1>Cerveja Invicta HellRibeirão</h1>

										<p />

										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>
											Invicta HellRibeirão<br> Origem: Ribeirão Preto - SP<br>
											Cervejaria: Invicta<br> Volume: 500ml <br> Preços:
											R$21,90<br> Teor Alcoólico: 4.5 %
										</p>
									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>

								</div>

							</div>

						</div>

						<!--  Cerveja Invicta HellRibeirão Pils -->






						<!--  Cerveja Invicta Iniciação-->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">

								<img src="imagens/invicta-iniciação.png" alt="iniciacao"
									width="40" height="110">


								<div class="container">

									<a href="#" data-toggle="modal" data-target="#modal-iniciacao"><b>Invicta
											Iniciação </b> </a>
								</div>

							</div>

						</div>


						<div class="modal" id="modal-iniciacao">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1>Cerveja Invicta Iniciação</h1>

										<p />

										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>
											Invicta Iniciação<br> Origem: Ribeirão Preto - SP<br>
											Cervejaria: Invicta <br> Volume: 500ml <br> Preços:
											R$26,99<br> Teor Alcoólico: 5 %
										</p>
									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>


								</div>

							</div>

						</div>

						<!--  Cerveja Invicta Iniciação-->







						<!--  Cerveja Invicta New Seenssion Session -->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">

								<img src="imagens/invicta-new-senssion session.png"
									alt="new-senssion" width="40" height="110">


								<div class="container">

									<a href="#" data-toggle="modal" data-target="#modal-session"><b>Invicta
											New Seenssion Session</b> </a>
								</div>

							</div>

						</div>


						<div class="modal" id="modal-session">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1>Cerveja Invicta New Seenssion Session</h1>

										<p />

										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>
											Invicta New Seenssion Session <br> Origem: Ribeirão
											Preto - SP<br> Cervejaria: Invicta <br> Volume:
											500ml <br> Preços: R$25,99<br> Teor Alcoólico: 4 %
										</p>
									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>


								</div>

							</div>

						</div>

						<!--  Cerveja Invicta New Seenssion Session -->





					</div>



					<div class="row mt-5">







						<!--  Cerveja sociedade-anonima -->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">

								<img src="imagens/invicta-sociedade-anonima.png"
									alt="sociedade-anonima" width="40" height="110">


								<div class="container">

									<a href="#" data-toggle="modal"
										data-target="#modal-sociedade-anonima"><b>Invicta
											Sociedade Anonima</b> </a>
								</div>

							</div>

						</div>


						<div class="modal" id="modal-sociedade-anonima">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1>Cerveja Invicta Sociedade Anonima</h1>

										<p />

										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>
											Invicta Sociedade Anonima <br> Origem: Ribeirão Preto -
											SP<br> Cervejaria: Invicta <br> Volume: 500ml <br>
											Preços: R$ 25,99<br> Teor Alcoólico: 8 %"
										</p>
									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>


								</div>

							</div>

						</div>

						<!--  Cerveja Invicta sociedade-anonima -->











						<!--  Cerveja Invicta Starlord -->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">


								<img src="imagens/invicta-stalord.png" alt="stalord" width="40"
									height="110">


								<div class="container">

									<a href="#" data-toggle="modal" data-target="#modal-starlord"><b>Invicta
											Starlord</b> </a>
								</div>

							</div>

						</div>


						<div class="modal" id="modal-starlord">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1>Cerveja Invicta Starlord</h1>

										<p />

										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>
											Invicta Starlord<br> Origem: Ribeirão Preto - SP<br>
											Cervejaria: Invicta <br> Volume: 500ml <br> Preços:
											R$25,99<br> Teor Alcoólico: 6 %
										</p>
									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>


								</div>

							</div>

						</div>

						<!--  Cerveja Invicta Starlord -->








						<!--  Cerveja Invicta Urbana Boo -->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">


								<img src="imagens/invicta-ubana-boo.png" alt="urbana-boo"
									width="40" height="110">


								<div class="container">

									<a href="#" data-toggle="modal" data-target="#modal-urbana-boo"><b>Invicta
											Urbana Boo</b> </a>
								</div>

							</div>

						</div>


						<div class="modal" id="modal-urbana-boo">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1>Cerveja Invicta Urbana Boo</h1>

										<p />

										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>
											Invicta Urbana Boo <br> Origem: Ribeirão Preto - SP<br>
											Cervejaria: Invicta <br> Volume: 500ml <br> Preços:
											R$25,99<br> Teor Alcoólico: 6 %
										</p>
									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>

								</div>

							</div>

						</div>

						<!--  Cerveja Invicta Urbana Boo -->










						<!--  Cerveja Invicta Urbana Fio Terra -->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">


								<img src="imagens/invicta-urabana-fio-terra.png" alt="fio-terra"
									width="40" height="110">


								<div class="container">

									<a href="#" data-toggle="modal"
										data-target="#modal-urbana-fioterra"><b>Invicta Urbana
											Fio Terra</b> </a>
								</div>

							</div>

						</div>


						<div class="modal" id="modal-urbana-fioterra">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1>Cerveja Invicta Urbana Fio Terra</h1>

										<p />

										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>
											Invicta Urbana Fio Terra<br> Origem: Ribeirão Preto - SP<br>
											Cervejaria: Invicta <br> Volume: 500ml <br> Preços:
											R$28,99<br> Teor Alcoólico: 8 %
										</p>
									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>


								</div>

							</div>

						</div>

						<!--  Cerveja Invicta Urbana Fio Terra -->






						<!--  Cerveja Invicta Velhas Virgens Beijos de Corpo-->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">


								<img src="imagens/invicta-velhas-virgens-beijos-de-corpo.png"
									alt="velhas-virgens-beijos de corpo" width="40" height="110">


								<div class="container">

									<a href="#" data-toggle="modal"
										data-target="#modal-beijosdecorpo"><b>Invicta Velhas
											Virgens Beijos de Corpo</b> </a>
								</div>

							</div>

						</div>


						<div class="modal" id="modal-beijosdecorpo">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1>Cerveja Invicta Velhas Virgens Beijos de Corpo</h1>

										<p />

										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>
											Invicta Velhas Virgens Beijos de Corpo <br> Origem:
											Ribeirão Preto - SP<br> Cervejaria: Invicta <br>
											Volume: 500ml <br> Preços: R$30,99<br> Teor
											Alcoólico: 5 %
										</p>
									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>


								</div>

							</div>

						</div>

						<!--  Cerveja Invicta Velhas Virgens Beijos de Corpo -->





						<!--  Cerveja Invicta Velhas Virgens Indie Man -->

						<div class="col-12 col-md-5 col-lg-2 conteudo">

							<div class="cerveja">


								<img src="imagens/invicta-velhas-virgens-indie-man.png"
									alt="velhas-virgens-indie-man" width="40" height="110">


								<div class="container">

									<a href="#" data-toggle="modal" data-target="#modal-idieman"><b>Invicta
											Velhas Virgens Indie Man</b> </a>
								</div>

							</div>

						</div>


						<div class="modal" id="modal-idieman">
							<div class="modal-dialog modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<p>
										<h1>Cerveja Invicta Velhas Virgens Indie Man</h1>

										<p />

										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>




									<div class="modal-body">
										<p>
											Invicta Velhas Virgens Indie Man<br> Origem: Ribeirão
											Preto - SP<br> Cervejaria: Invicta <br> Volume:
											500ml <br> Preços: R$30,99<br> Teor Alcoólico: 8 %
										</p>
									</div>

									<div class="modal-footer">

									
										<button type="button" class="btn btn-danger btn-sm"
											data-dismiss="modal">Fechar</button>
									</div>


								</div>

							</div>

						</div>

						<!--  Cerveja Invicta Velhas Virgens Indie Man -->





					</div>
					<br> <br>
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