<%@page import="dao.DaoUsuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Excluir Registro</title>
</head>
<body>
<% 
int codigo = Integer.parseInt(request.getParameter("id"));


DaoUsuario dao = new DaoUsuario();

dao.delete(codigo);

%>
<script>
		alert("Cerveja excluida com Sucesso!")
		window.location.href="principal.jsp";
	</script>
</body>
</html>