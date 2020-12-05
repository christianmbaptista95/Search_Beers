<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Beers - Login</title>
<jsp:useBean id="usuario" class="modelo.Usuario"></jsp:useBean>
<jsp:useBean id="dao" class="dao.DaoUsuario"></jsp:useBean>
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
	<div id="area-cabecalho">





		<div class="area-principal">



			<form class="form" action="../Autenticacao" method="post">

				<div class="card">


					<a href="../Autenticacao"><img src="imagens/inicio.png" alt=""
						width="30" height="30"></a>

					<div class="card-top">
						<img class="img-login" src="imagens/usuario.png" alt="" />
						<p>
							<b>Acesse sua conta</b>
						</p>
					</div>

					<div class="card-group">
						<label for="login">Login:</label> <input class="form-control"
							type="text" name="login" id="login">
					</div>

					<div class="card-group">
						<label for="senha">Senha:</label> <input class="form-control" type="password" name="senha" id="senha"> 
					</div>

					<div class="container">

						<button type="submit" class="btn">Entrar</button>



						<button type="button" class="btn" data-toggle="modal"
							data-target="#modalCadastro">Cadastro</button>
					</div>


				</div>
			</form>





			<!-- Modal para cadastramento de registros -->
			<div class="modal fade" id="modalCadastro">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">

						<!-- Cabeçalho -->
						<div class="modal-header">
							<h3 class="modal-title">Cadastro de Usuários</h3>

						</div>

						<!-- Corpo -->
						<div class="modal-body">
							<form action="insertUsuario.jsp" method="post">
								<input type="hidden" name="operacao" value="insert">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="name">Nome:</label> <input class="form-control"
												type="text" name="nome" id="nome" required>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label for="name">E-mail:</label> <input class="form-control"
												type="text" name="email" id="email" required>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label for="name">Login:</label> <input class="form-control"
												type="text" name="login" id="login" required>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label for="name">Senha:</label> <input class="form-control"
												type="password" name="senha" id="senha" required>
										</div>
									</div>



								</div>



								<!-- Rodape -->
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary btn-sm">Gravar</button>
									<button type="button" class="btn btn-secondary btn-sm"
										data-dismiss="modal">Cancelar</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="modal" id="modal-recuperacao">
				<div class="modal-dialog modal-dialog-scrollable">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Esqueci minha senha</h4>
						</div>


						<div class="modal-body">Em construção!</div>


						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>



					</div>
				</div>
			</div>

		</div>

	</div>
</body>
</html>