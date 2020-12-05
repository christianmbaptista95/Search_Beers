package controlador;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import static javax.swing.JOptionPane.showMessageDialog;

import modelo.Produto;
import modelo.Usuario;
import dao.DaoProduto;
import dao.DaoUsuario;

@WebServlet("/ProdutoControlador")
@MultipartConfig
public class ProdutoControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DaoProduto dao = new DaoProduto();
	

	public ProdutoControlador() {
		
		super();
		dao = new DaoProduto();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String operacao = request.getParameter("operacao");

		switch (operacao) {

		case "insert":
			// Gravar registro no banco de dados
			incluiRegistro(request, response);
			break;

		case "delete":
			// Exluir registro no banco de dados
			
			break;

		case "update":
			// Atualizar registro no banco de dados
			break;

		case "select":
			// Exibir todos os registros no banco de dados
			
			selectAll(request,response);
			
			break;

		case "selectNome":
			// Pesquisa pelo nome do os registro
			selectNome(request,response);
			
			break;

		default:
			break;
		}

	}
	
		// Criar a lista a partir de uma pesquisa pelo nome do registros do banco de dados
		// Os quais serão exibidos pelo arquivo  principal.jsp
	private void selectNome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nomePesquisa = request.getParameter("pesquisa");
		
		List<Produto> listaProdutos = dao.selectNome(nomePesquisa);
		request.setAttribute("listaRegistros", listaProdutos);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Search_Beers/principal.jsp");
		dispatcher.forward(request, response);
		
	}

	// Criar a lista com todos os registros do banco de dados
	// Os quais serão exibidos pelo arquivo  principal.jsp
	private void selectAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			List<Produto> listaProdutos = dao.select();
			request.setAttribute("listaRegistros", listaProdutos);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Search_Beers/alertaCadastroCerveja.jsp");
			dispatcher.forward(request, response);

	}

	private void incluiRegistro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String nome = request.getParameter("nome");
		String origem = request.getParameter("origem");
		String fabricante = request.getParameter("fabricante");
		int volume = Integer.parseInt(request.getParameter("volume"));
		double preco = Double.parseDouble(request.getParameter("preco"));
		String teor_alcoolico = request.getParameter("teor_alcoolico");
		String foto = request.getParameter("foto");
		int usuario_codigo = Integer.parseInt(request.getParameter("usuarioAutenticado"));
		

			
		Produto produto = new Produto();
		
		
		produto.setNome(nome);
		produto.setOrigem(origem);
		produto.setFabricante(fabricante);
		produto.setVolume(volume);
		produto.setPreco(preco);
		produto.setTeor_alcoolico(teor_alcoolico);
		produto.setFoto(uploadFoto(request, response));
		produto.setUsuario_codigo(usuario_codigo);

		
		
		
		dao.insert(produto);
		response.sendRedirect("ProdutoControlador?operacao=select");

		
		
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	// Efetua o upload do arquivo de foto
	private String uploadFoto(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Obtem o arquivo do formulário
		Part aquivo = request.getPart("foto");

		// Local onde será salvo o arquivo
		String diretorio = this.getServletContext().getRealPath(".");
		diretorio += "/Search_Beers/imagens/";

		// Cria o diretório caso não exista
		File fileDir = new File(diretorio);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}

		// Obtem o nome do arquivo
		String nomeArquivo = aquivo.getSubmittedFileName();

		// Grava o arquivo no disco
		aquivo.write(diretorio + nomeArquivo);

		return nomeArquivo;
	}

}
