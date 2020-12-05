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
		// Verifica se o usuário está autenticado
	HttpSession sessao = request.getSession();
	Usuario usuarioAutenticado = null;
	DaoUsuario dao = new DaoUsuario();
	String perfilUsuario = null;
	int idUsuarioAutenticado = 0;
	String nomUsuarioAutenticado = "";
	try {
		perfilUsuario = (String) sessao.getAttribute("perfil");
		usuarioAutenticado = (Usuario) sessao.getAttribute("usuario");
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
		DaoUsuario daoUsuario = new DaoUsuario();
	List<Usuario> listaUsuario = new ArrayList<Usuario>();

	String nomePesquisaUsuario = "";
	nomePesquisaUsuario = request.getParameter("pesquisa");

	if (nomePesquisaUsuario == null) {
		listaUsuario = daoUsuario.select();
	} else {
		listaUsuario = daoUsuario.selectNome(nomePesquisaUsuario);
	}
	%>







	<div class="area-principal">


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
					<li><a href="../Autenticacao"><img src="imagens/sair.png"
							alt="imagem" width="30" height="30"></a></li>
				</ul>
			</nav>
		</div>





		<!--  Card -->


		<div class="card-header">

			<div class="row">
				<div class="col-sm-6">
					<div class="card border-secondary">

						<div class="card-body">
							<h3 class="card-title">Cadastro de Usuários</h3>
							<p class="card-text">Formulário de cadastro de usuários..</p>
							<a href="#" class="btn btn-primary" data-toggle="modal"
								data-target="#modal-cadastro-usuarios">Cadastrar</a>

						</div>
					</div>

				</div>
				<div class="col-sm-6">
					<div class="card border-secondary">
						<div class="card-body">

							<h3 class="card-title">Cadastro de Cervejas</h3>
							<p class="card-text">Formulário de cadastro de Cervejas..</p>
							<a href="#" class="btn btn-primary" data-toggle="modal"
								data-target="#modal-cadastro-cervejas">Cadastrar</a>
						</div>
					</div>
				</div>



			</div>
			<br>
			<div class="row">
				<div class="col-sm-6">
					<div class="card border-secondary">
						<div class="card-body">


							<h3>Listagem de Usuários</h3>
							<p class="card-text">Listagem usuários cadastrados..</p>
							<a href="#" class="btn btn-primary" data-toggle="modal"
								data-target="#modal-listagem-usuarios">Listar</a>






						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="card border-secondary">

						<div class="card-body">

							<h3 class="card-title">Listagem de Cervejas</h3>
							<p class="card-text">Listagem de cervejas cadastradas..</p>
							<a href="#" class="btn btn-primary" data-toggle="modal"
								data-target="#modal-listagem-cervejas">Listar</a>
						</div>
					</div>
				</div>
			</div>
			<br>

			<!--  Card -->


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





	<!-- Modal cadastro de cervejas -->
	<div class="modal" id="modal-cadastro-cervejas">
		<div class="modal-dialog modal-lg" data-backdrop="static">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">Cadastro de Cervejas</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>


				<div class="modal-body">
					<form id="form-inclusao-registro" action="../ProdutoControlador"
						method="post" enctype="multipart/form-data">
						<input type="hidden" name="operacao" value="insert"> <input
							type="hidden" name="usuarioAutenticado"
							value="<%=idUsuarioAutenticado%>">

						<div class="row">


							<div class="col-12 col-md-6">
								<div class="form-group">
									Nome: <input type="text" class="form-control" id="nome"
										name="nome" placeholder="" required>
								</div>
							</div>

							<div class="col-12 col-md-6">
								<div class="form-group">
									Origem: <input type="text" class="form-control" id="origem"
										name="origem" placeholder="" required>
								</div>
							</div>

							<div class="col-12 col-md-6">
								<div class="form-group">
									Fabricante: <input type="text" class="form-control"
										id="fabricante" name="fabricante" placeholder="" required>
								</div>
							</div>

							<div class="col-12 col-md-6">
								<div class="form-group">
									Volume: <input type="text" class="form-control" id="volume"
										name="volume" placeholder="" required>
								</div>
							</div>

							<div class="col-12 col-md-6">
								<div class="form-group">
									Preço: <input type="text" class="form-control" id="preco"
										name="preco" placeholder="" required>
								</div>
							</div>

							<div class="col-12 col-md-6">
								<div class="form-group">
									Teor alcoólico: <input type="text" class="form-control"
										id="teor_alcoolico" name="teor_alcoolico" placeholder=""
										required>
								</div>
							</div>


							<div class="col-md-6">
								<div class="form-group">
									<label for="foto">Foto:</label> <input class="form-control"
										type="file" name="foto" id="foto">
								</div>
							</div>



						</div>

						<div class="modal-footer">
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn btn-block mt-2">Gravar</button>
							</div>
							<div class="form-group">
								<button type="button"
									class="btn btn-secondary btn btn-block mt-2"
									data-dismiss="modal">Cancelar</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal cadastro de cervejas -->




	<!-- Modal cadastro de usuários-->
	<div class="modal fade" id="modal-cadastro-usuarios">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Cabeçalho -->
				<div class="modal-header">
					<h3 class="modal-title">Cadastro de Usuários</h3>

				</div>

				<!-- Corpo -->
				<div class="modal-body">
					<form action="insertUsuario.jsp" method="post">
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



							<div class="form-group col-md-4">
								<label for="perfil">Perfil:</label> <select name="perfil"
									id="perfil" class="form-control">
									<option>Administrador</option>
									<option>Colaborador</option>
									<option>Comum</option>
								</select>
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

	<!-- Modal cadastro de usuários-->






	<!--  Modal Listagem de usuários -->
	<div class="modal" id="modal-listagem-usuarios">
		<div class="modal-dialog modal-xl" data-backdrop="static">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">Listar Produtos</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>


				<div class="modal-body"></div>
				<div class="modal-body">
					<form id="form-inclusao-registro" action="" method="post">

						<div class="row">



							<div class="container">
								<h2>Sistema de controle de Cervejas</h2>
								<div class="card">
									<div class="card-header">
										<span><b>Listagem de Registros</b></span>
										<div style="float: right">
											<form action="principal.jsp" method="post">
												<label for="pesquisa">Nome:</label> <input type="text"
													name="pesquisa" id="pesquisa"> <input
													class="btn btn-success btn-sm" type="submit"
													value="Pesquisar">
											</form>
										</div>
									</div>

									<div class="card-body">
										<table class="table table-hover">
											<thead>
												<tr style="color: white;">
													<th>Código</th>
													<th>Nome</th>
													<th>E-mail</th>
													<th>Login</th>
													<th>Senha</th>
													<th>Perfil</th>
													<th colspan="2">Operações</th>
												</tr>
											</thead>
											</tbody>


											<%
												for (Usuario usuario : listaUsuario) {
											%>
											<tr style="color: white;">
												<td><%=usuario.getCodigo()%></td>
												<td><%=usuario.getNome()%></td>
												<td><%=usuario.getEmail()%></td>
												<td><%=usuario.getLogin()%></td>
												<td><%=usuario.getSenha()%></td>
												<td><%=usuario.getPerfil()%></td>
												<td><a
													href="formUpdateUsuario.jsp?idAlteracao=<%=usuario.getCodigo()%>"
													class="btn btn-warning btn-sm">Editar</a></td>
												<td><a
													href="deleteUsuario.jsp?id=<%=usuario.getCodigo()%>"
													class="btn btn-danger btn-sm">Excluir</a></td>
											</tr>
											<%
												}
											%>
											</tbody>
										</table>
									</div>

								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--  Modal Listagem de usuários -->



	<!--  Modal Listagem de Cervejas  -->
	<div class="modal" id="modal-listagem-cervejas">
		<div class="modal-dialog modal-xl" data-backdrop="static">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">Listar Produtos</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>


				<div class="modal-body"></div>
				<div class="modal-body">
					<form id="form-inclusao-registro" action="" method="post">

						<div class="row">



							<div class="container">
								<h2>Sistema de controle de Cervejas</h2>
								<div class="card">
									<div class="card-header">
										<span><b>Listagem de Registros</b></span>
										<div style="float: right">
											<form action="principal.jsp" method="post">
												<label for="pesquisa">Nome:</label> <input type="text"
													name="pesquisa" id="pesquisa"> <input
													class="btn btn-success btn-sm" type="submit"
													value="Pesquisar">
											</form>
										</div>
									</div>

									<div class="card-body">
										<table class="table table-hover">
											<thead>
												<tr style="color: white;">
													<th>Foto</th>
													<th>id</th>
													<th>Nome</th>
													<th>Origem</th>
													<th>Fabricante</th>
													<th>Volume</th>
													<th>Preco</th>
													<th>Teor Alcoolico</th>
													<th>Cadastrado por</th>

													<th colspan="2">Operações</th>
												</tr>
											</thead>
											</tbody>


											<%
												for (Produto produto : listaProduto) {
											%>
											<tr style="color: white;">
												<td><img width="30px"
													src="imagens/<%=produto.getFoto()%>"></td>
												<td><%=produto.getId()%></td>
												<td><%=produto.getNome()%></td>
												<td><%=produto.getOrigem()%></td>
												<td><%=produto.getFabricante()%></td>
												<td><%=produto.getVolume()%></td>
												<td><%=produto.getPreco()%></td>
												<td><%=produto.getTeor_alcoolico()%></td>
												<td><%=daoProduto.getNomeById(produto.getUsuario_codigo())%></td>


												<td><a
													href="formUpdateProduto.jsp?idAlteracao=<%=produto.getId()%>"
													class="btn btn-warning btn-sm">Editar</a></td>
												<td><a href="deleteProduto.jsp?id=<%=produto.getId()%>"
													class="btn btn-danger btn-sm">Excluir</a></td>
											</tr>
											<%
												}
											%>
											</tbody>
										</table>
									</div>

								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--  Modal Listagem de Cervejas -->
</body>
</html>