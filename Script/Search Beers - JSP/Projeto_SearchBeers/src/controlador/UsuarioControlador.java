package controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoUsuario;
import modelo.Usuario;

@WebServlet("/UsuarioControlador")
public class UsuarioControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DaoUsuario dao;

	public UsuarioControlador() {
		super();
		dao = new DaoUsuario();

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
			selectAll(request, response);
			break;

		case "selectNome":
			// Pesquisa pelo nome do os registro
			selectNome(request, response);
			break;
		case "login":
			// Exibir todos os registros no banco de dados
			login(request, response);
			break;

		default:
			break;

		}

	}
	
	
	
	
	// Insere um novo registro no banco de dados
	private void incluiRegistro(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");

		Usuario usuario = new Usuario();

		usuario.setNome(nome);
		usuario.setEmail(email);
		usuario.setLogin(login);
		usuario.setSenha(senha);

		dao.insert(usuario);
		response.sendRedirect("Search_Beers/login.jsp");

	}
	
	// Criar a lista com todos os registros do banco de dados
	// Os quais serão exibidos pelo arquivo principal_teste.jsp
	private void selectAll(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		List<Usuario> listaUsuarios = dao.select();
		request.setAttribute("listaRegistros", listaUsuarios);
		
		response.sendRedirect("Search_Beers/login.jsp");

		//RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		//dispatcher.forward(request, response); 

	
	}
	
	private void selectNome(HttpServletRequest request, HttpServletResponse response) {

	}
	

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int codigo = Integer.parseInt(request.getParameter("id"));

		dao.delete(codigo);

		response.sendRedirect("Search_Beers/principal.jsp");
	}
	
	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("Search_Beers/login.jsp");  
		
	}

	


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
