package visao;

import java.util.ArrayList;
import java.util.List;


import dao.DaoProduto;
import modelo.Produto;

public class FormSelectProduto {
	public static void main(String[] args) {
		DaoProduto dao = new DaoProduto();
		List<Produto> listaProduto = new ArrayList<Produto>();
	
		listaProduto = dao.select();
		
	
		System.out.println("Lista de Usuários Cadastrados: \n");
		for(Produto produto : listaProduto) {
			System.out.println("ID: " + produto.getId());
			System.out.println("Nome: " + produto.getNome());
			System.out.println("Origem: " + produto.getOrigem());
			System.out.println("Fabricante: " + produto.getPreco());
			System.out.println("Teor Alcoolico: " + produto.getTeor_alcoolico());
			System.out.println("Foto: " + produto.getFoto());
			System.out.println("Usuario_codigo: " + produto.getUsuario_codigo());
			System.out.println("------------------------------");
		}
	}

}
