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
	String login;
	String senha;
	String eMail;
	String perfil;

	List<Usuario> listaAlteracao = new ArrayList<Usuario>();
	DaoUsuario dao = new DaoUsuario();

	idAlteracao = Integer.parseInt(request.getParameter("idAlteracao"));

	listaAlteracao = dao.selectCodigo(idAlteracao);

	nome = listaAlteracao.get(0).getNome();
	login = listaAlteracao.get(0).getLogin();
	senha = listaAlteracao.get(0).getSenha();
	eMail = listaAlteracao.get(0).getEmail();
	perfil = listaAlteracao.get(0).getPerfil();
	
	
	
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
							<form action="updateUsuario.jsp" method="post">
								<input type="hidden" name="idAlteracao" value="<%=idAlteracao%>">
								<div class="row">
									<div class="row">

										<div class="col-md-6">
											<div class="form-group">
												<label for="name">Nome:</label> <input class="form-control"
													type="text" name="nome" id="nome" value="<%=nome%>">
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												<label for="name">Login:</label> <input class="form-control"
													type="text" name="login" id="login" value="<%=login%>">
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												<label for="name">Senha:</label> <input class="form-control"
													type="text" name="senha" id="senha" value="<%=senha%>">
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												<label for="name">Email:</label> <input class="form-control"
													type="text" name="email" id="email" value="<%=eMail%>">
											</div>
										</div>

										<div class="form-group col-md-4">
											<label for="perfil">Perfil:</label> <select name="perfil"
												id="perfil" class="form-control" value="<%=perfil%>">
												<option>Administrador</option>
												<option>Colaborador</option>
												<option>Comum</option>
											</select>
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