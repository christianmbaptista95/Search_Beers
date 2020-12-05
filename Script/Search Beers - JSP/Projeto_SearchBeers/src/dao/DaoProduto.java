package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import banco.Conexao;
import modelo.Produto;
import modelo.Usuario;

public class DaoProduto {
	
	private Connection con;
	private Conexao conexao;
	
	public DaoProduto() {
		this.conexao = Conexao.getInstancia();
		this.con = this.conexao.conecta();
	}
	
	// Insere um registro no banco de dados
		public void insert(Produto produto) {
			String sql = "INSERT INTO produto (nome,origem,fabricante,volume,preco,teor_alcoolico,foto,usuario_codigo) VALUES (?,?,?,?,?,?,?,?) ";
			
			
			try {
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1,produto.getNome());
				stmt.setString(2, produto.getOrigem());
				stmt.setString(3, produto.getFabricante());
				stmt.setInt(4, produto.getVolume());
				stmt.setDouble(5, produto.getPreco());
				stmt.setString(6, produto.getTeor_alcoolico());
				stmt.setString(7, produto.getFoto());
				stmt.setInt(8, produto.getUsuario_codigo());
				
			
				stmt.execute();
				stmt.close();
				
			}catch(Exception e) {
				System.out.println("Falha na inclusão do registro.");
				System.out.println(e.getMessage());
			}
		  }

		
	
		

		//Alteração de um registro no banco de dados
		public void update(Produto produto) {
			String sql = "UPDATE produto SET nome = ?, origem = ?, fabricante = ?, volume = ?, preco = ?, teor_alcoolico = ? WHERE usuario_codigo = ?";
			
			try {
				PreparedStatement stmt = con.prepareStatement(sql);
				
				
				
				stmt.setString(1,produto.getNome());
				stmt.setString(2,produto.getOrigem());
				stmt.setString(3,produto.getFabricante());
				stmt.setInt(4,produto.getVolume());
				stmt.setDouble(5,produto.getPreco());
				stmt.setString(6,produto.getTeor_alcoolico());
				stmt.setString(7,produto.getFoto());
				stmt.setInt(8,produto.getId());

				
				stmt.execute();
				stmt.close();
				
			}catch(Exception e) {
				System.out.println("Falha na edição do registro.");
				System.out.println(e.getMessage());
			}
		}
		
		
				//Obtem todos os registros do banco de dados
				public List<Produto> select() {
					String sql = "SELECT * FROM produto";
					return executaSelect(sql);
				}
				
				//Pesquisa os registros pelo nome
					public List<Produto> selectNome(String nome) {
						String sql = "SELECT * FROM produto WHERE nome like \"%"+ nome +"%\"";
						return executaSelect(sql);
					}
					
				//	Pesquisa os registros pela chave primária
					public List<Produto> selectId(int id) {
						String sql = "SELECT * FROM produto WHERE id = " + id;
						return executaSelect(sql);
					}
						

				//Executa qualquer consulta no banco
				public List<Produto> executaSelect(String sql) {
					List<Produto> listaProdutos = new ArrayList<Produto>();
					
					try {
						PreparedStatement stmt = con.prepareStatement(sql);
						ResultSet rs = stmt.executeQuery();
						
						while(rs.next()) {
							
							Produto p = new Produto();
							
							p.setId(rs.getInt("id"));
							p.setNome(rs.getString("nome"));
							p.setOrigem(rs.getString("origem"));
							p.setFabricante(rs.getString("fabricante"));
							p.setVolume(rs.getInt("volume"));
							p.setPreco(rs.getDouble("preco"));
							p.setTeor_alcoolico(rs.getString("teor_alcoolico"));
							p.setFoto(rs.getString("foto"));
							
							
							listaProdutos.add(p);
						}
						
						rs.close();
						stmt.close();
						
						
					}catch (Exception e) {
						System.out.println("Falha na consulta ao banco de dados");
						System.out.println(e.getMessage());
					}
					
					
					
					return listaProdutos;
				}
				
				
				public List<Produto> getNomeById(int id){
					
					String sql ="SELECT * FROM produto WHERE usuario_codigo = " + id;
					return executaSelect(sql);
				}
				
				
				
				//Excluir um registro do banco de dados
				public void delete(int id) {
					String sql = "DELETE FROM produto WHERE id = " +  id;
					
					try {
						PreparedStatement stmt = con.prepareStatement(sql);
						stmt.execute();
						stmt.close();
					}catch(Exception e) {
						System.out.println("Falha na exclusão do registro.");
						System.out.println(e.getMessage());
					}
				}
	

			}
