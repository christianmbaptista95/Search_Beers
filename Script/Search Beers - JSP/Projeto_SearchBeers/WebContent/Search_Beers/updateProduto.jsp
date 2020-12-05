<%@page import="modelo.Produto"%>
<%@page import="dao.DaoProduto"%>
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

Produto produto = new Produto();
DaoProduto dao = new DaoProduto();





produto.setNome(request.getParameter("nome"));







produto.setNome(request.getParameter("nome"));
produto.setOrigem(request.getParameter("origem"));
produto.setFabricante(request.getParameter("fabricante"));
produto.setVolume(Integer.parseInt(request.getParameter("volume")));
produto.setPreco(Double.parseDouble(request.getParameter("preco")));
produto.setTeor_alcoolico(request.getParameter("teor_alcoolico"));
produto.setFoto(request.getParameter("foto"));



dao.update(produto);

%>
<script>
		alert("Registro Alterado com Sucesso!")
		window.location.href="principal.jsp";
	</script>
</body>
</html>