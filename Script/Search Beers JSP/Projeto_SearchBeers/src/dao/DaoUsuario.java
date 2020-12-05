package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import banco.Conexao;
import modelo.Produto;
import modelo.Usuario;

public class DaoUsuario {
	
	
	private Connection con;
	private Conexao conexao;
	
	public DaoUsuario() {
		this.conexao = Conexao.getInstancia();
		this.con = this.conexao.conecta();
	}
	
	
	public List<Usuario> getAutenticacao(String nome, String senha) {
		String sql = "SELECT * FROM usuario where login = '" + nome + "'" + " and senha = '" + senha + "'";
		return executaSelect(sql);
	}
	
	
	
	//Executa qualquer consulta no banco
	public List<Usuario> executaSelect(String sql) {
		List<Usuario> listaUsuarios = new ArrayList<Usuario>();
		
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Usuario u = new Usuario();
				u.setCodigo(rs.getInt("codigo"));
				u.setNome(rs.getString("nome"));
				u.setEmail(rs.getString("email"));
				u.setLogin(rs.getString("login"));
				u.setSenha(rs.getString("senha"));
				u.setPerfil(rs.getString("perfil"));
				
				listaUsuarios.add(u);
			}
			
			rs.close();
			stmt.close();
			
			
		}catch (Exception e) {
			System.out.println("Falha na consulta ao banco de dados");
			System.out.println(e.getMessage());
		}
		
		
		
		return listaUsuarios;
	}
	
	//Retorna o nome em função do ID
	public List<Usuario> getNomeById(int id){
		String sql = "SELECT * FROM usuario WHERE codigo = " + id;
		return executaSelect(sql);
	}
	
	
	
	// Insere um registro no banco de dados
		public void insert(Usuario usuario) {
			String sql = "INSERT INTO usuario (nome,login,senha,email,perfil) VALUES (?,?,?,?,?) ";
			
			
			try {
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1,usuario.getNome());
				stmt.setString(2, usuario.getLogin());
				stmt.setString(3, usuario.getSenha());
				stmt.setString(4, usuario.getEmail());
				stmt.setString(5, usuario.getPerfil());
			
				stmt.execute();
				stmt.close();
				
			}catch(Exception e) {
				System.out.println("Falha na inclusão do registro.");
				System.out.println(e.getMessage());
			}
		  }
		
		//Excluir um registro do banco de dados
		public void delete(int codigo) {
			String sql = "DELETE FROM usuario WHERE codigo = " +  codigo;
			
			try {
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.execute();
				stmt.close();
			}catch(Exception e) {
				System.out.println("Falha na exclusão do registro.");
				System.out.println(e.getMessage());
			}
		}

		
		//Alteração de um registro no banco de dados
		public void update(Usuario usuario) {
			String sql = "UPDATE usuario SET nome = ?, email = ?, login = ?,senha = ?,perfil = ? WHERE codigo = ?";
			
			try {
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1,usuario.getNome());
				stmt.setNString(2, usuario.getEmail());
				stmt.setString(3,usuario.getLogin());
				stmt.setString(4,usuario.getSenha());
				stmt.setString(5,usuario.getPerfil());
				stmt.setInt(6, usuario.getCodigo());
				stmt.execute();
				stmt.close();
				
			}catch(Exception e) {
				System.out.println("Falha na edição do registro.");
				System.out.println(e.getMessage());
			}
		}
		

	
		//Obtem todos os registros do banco de dados
		public List<Usuario> select() {
			String sql = "SELECT * FROM usuario";
			return executaSelect(sql);
		}
		
		//Pesquisa os registros pelo nome
			public List<Usuario> selectNome(String nome) {
				String sql = "SELECT * FROM usuario WHERE nome like \"%"+ nome +"%\"";
				return executaSelect(sql);
			}
			
		//	Pesquisa os registros pela chave primária
			public List<Usuario> selectCodigo(int codigo) {
				String sql = "SELECT * FROM usuario WHERE codigo = " + codigo;
				return executaSelect(sql);
			}


	}
