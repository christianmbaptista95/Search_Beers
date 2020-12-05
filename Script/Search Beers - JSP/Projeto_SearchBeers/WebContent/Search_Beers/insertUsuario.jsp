<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inserção de usuário</title>
<jsp:useBean id="usuario" class="modelo.Usuario"></jsp:useBean>
<jsp:useBean id="dao" class="dao.DaoUsuario"></jsp:useBean>



</head>
<body>


	<%
	String nome = request.getParameter("nome");
	String login = request.getParameter("login");
	String senha = request.getParameter("senha");
	String email = request.getParameter("email");
	String perfil = request.getParameter("perfil");
	
	
	usuario.setNome(nome);
	usuario.setLogin(login);
	usuario.setSenha(senha);
	usuario.setEmail(email);
	usuario.setPerfil(perfil);
	
	dao.insert(usuario);

	%>
	<script>
		alert("Usuário Cadastrado com Sucesso!")
		window.location.href="login.jsp";
	</script>
</body>
