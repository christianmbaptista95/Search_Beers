<%@page import="dao.DaoUsuario"%>
<%@page import="modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

Usuario usuario = new Usuario();
DaoUsuario dao = new DaoUsuario();





usuario.setNome(request.getParameter("nome"));
usuario.setLogin(request.getParameter("login"));
usuario.setSenha(request.getParameter("senha"));
usuario.setEmail(request.getParameter("email"));
usuario.setPerfil(request.getParameter("perfil"));
usuario.setCodigo(Integer.parseInt(request.getParameter("idAlteracao")));



dao.update(usuario);

%>
<script>
		alert("Registro Alterado com Sucesso!")
		window.location.href="principal.jsp";
	</script>
</body>
</html>