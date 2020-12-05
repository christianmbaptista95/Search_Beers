<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inserção de dados</title>
<jsp:useBean id="produto" class="modelo.Produto"></jsp:useBean>
<jsp:useBean id="dao" class="dao.DaoProduto"></jsp:useBean>



</head>
<body>


	<%
	String nome = request.getParameter("nome");
	String origem = request.getParameter("origem");
	String fabricante = request.getParameter("fabricante");
	int volume = Integer.parseInt(request.getParameter("volume"));
	double preco = Double.parseDouble(request.getParameter("preco"));
	String teor_alcoolico = request.getParameter("teor_alcoolico");
	String foto = request.getParameter("foto");


	produto.setNome(nome);
	produto.setOrigem(origem);
	produto.setFabricante(fabricante);
	produto.setVolume(volume);
	produto.setPreco(preco);
	produto.setTeor_alcoolico(teor_alcoolico);
	produto.setFoto(foto);

	
	
	dao.insert(produto);
	%>
	<script>
		alert("Cerveja Cadastrado com Sucesso!")
		window.location.href="principal.jsp";
	</script>
</body>
</html>