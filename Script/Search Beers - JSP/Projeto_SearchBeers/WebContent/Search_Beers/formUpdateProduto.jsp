<%@page import="modelo.Produto"%>
<%@page import="dao.DaoProduto"%>
<%@page import="dao.DaoUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Beers - Principal</title>
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
		int idAlteracao;
	String nome;
	String origem;
	String fabricante;
	int volume;
	double preco;
	String teor_alcoolico;
	String foto;

	List<Produto> listaAlteracao = new ArrayList<Produto>();
	DaoProduto dao = new DaoProduto();

	idAlteracao = Integer.parseInt(request.getParameter("idAlteracao"));

	listaAlteracao = dao.selectId(idAlteracao);

	nome = listaAlteracao.get(0).getNome();
	origem = listaAlteracao.get(0).getOrigem();
	fabricante = listaAlteracao.get(0).getFabricante();
	volume = listaAlteracao.get(0).getVolume();
	preco = listaAlteracao.get(0).getPreco();
	teor_alcoolico = listaAlteracao.get(0).getTeor_alcoolico();
	foto = listaAlteracao.get(0).getFoto();
	%>



	<div class="area-principal">

		<div id="area-cabecalho">

			<div id="area-logo">

				<img id="logo" src="imagens/logo.png" alt="imagem">

				<h3>Search Beers</h3>

				<p>
					<b>Usuário:</b> Administrador | <b>Perfil:</b> Administrador | <a
						href="login.jsp"><b>Sair</b></a>
				</p>


			</div>

			<div class="postagem">


				<div class="card-header">
					<div class="card border-secondary">
						<div class="container">
							<h1>Alteração de Registros</h1>
							<form action="updateProduto.jsp" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="idAlteracao" value="<%=idAlteracao%>">
								<div class="row">





									<div class="col-md-6">
										<div class="form-group">
											<label for="name">Nome:</label> <input class="form-control"
												type="text" name="nome" id="nome" value="<%=nome%>">
										</div>
									</div>



									<div class="col-md-6">
										<div class="form-group">
											<label for="name">Origem:</label> <input class="form-control"
												type="text" name="origem" id="origem" value="<%=origem%>">
										</div>
									</div>


									<div class="col-md-6">
										<div class="form-group">
											<label for="name">Fabricante:</label> <input
												class="form-control" type="text" name="fabricante"
												id="fabricante" value="<%=fabricante%>">
										</div>
									</div>


									<div class="col-md-6">
										<div class="form-group">
											<label for="name">Volume:</label> <input class="form-control"
												type="text" name="volume" id="volume" value="<%=volume%>">
										</div>
									</div>


									<div class="col-md-6">
										<div class="form-group">
											<label for="name">Preco:</label> <input class="form-control"
												type="text" name="preco" id="preco" value="<%=preco%>">
										</div>
									</div>


									<div class="col-md-6">
										<div class="form-group">
											<label for="name">Teor Alcoolico:</label> <input
												class="form-control" type="text" name="teor_alcoolico"
												id="teor_alcoolico" value="<%=teor_alcoolico%>">
										</div>
									</div>



									<div class="col-md-6">
										<div class="form-group">
											<label for="foto">Foto:</label> <input class="form-control"
												type="file" name="foto" id="foto">
										</div>

									</div>

								</div>


								<div class="row">

									<div class="col-sm-6 col-md-2">
										<button type="submit" class="mt-2 btn btn-block btn-primary">Gravar</button>
									</div>

									<div class="col-sm-6 col-md-2">
										<button class="mt-2 btn btn-block btn-secondary ">Cancelar</button>
									</div>


								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>