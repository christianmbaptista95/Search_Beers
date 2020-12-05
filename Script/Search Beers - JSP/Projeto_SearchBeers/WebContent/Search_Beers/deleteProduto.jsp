<%@page import="dao.DaoProduto"%>
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


DaoProduto dao = new DaoProduto();

dao.delete(codigo);

%>
<script>
		alert("Usuário excluido com Sucesso!")
		window.location.href="principal.jsp";
	</script>
</body>
</html>