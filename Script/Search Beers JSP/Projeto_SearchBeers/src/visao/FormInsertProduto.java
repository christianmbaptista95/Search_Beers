package visao;

import dao.DaoProduto;
import modelo.Produto;
import modelo.Usuario;

public class FormInsertProduto {
	

	public static void main(String [] args) {
		
		
		Usuario usuario = new Usuario();
		
		Produto produto = new Produto();
		
		DaoProduto dao = new DaoProduto();
		
		produto.setNome("Colorado Appia");
		produto.setOrigem("Ribeirão Preto - SP");
		produto.setFabricante("Colorado");
		produto.setVolume(600);
		produto.setPreco(8.98);
		produto.setTeor_alcoolico("5.5 %");
		produto.setFoto("/imagens/colorado-appia.png");
	
		
		dao.insert(produto);
		System.out.println("Registro inserido com sucesso.");
		
		
		
		
	}
	
	

}
