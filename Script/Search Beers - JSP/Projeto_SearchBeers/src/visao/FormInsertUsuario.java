package visao;

import dao.DaoUsuario;
import modelo.Usuario;


public class FormInsertUsuario {

	public static void main(String[] args) {
		
		Usuario usuario = new Usuario();
		
		DaoUsuario dao = new DaoUsuario();
		
		usuario.setNome("Christian Marcelino Baptista");
		usuario.setLogin("christianmb");
		usuario.setSenha("123456");
		usuario.setEmail("christianmbaptista@hotmail.com");
		
		dao.insert(usuario);
		System.out.println("Registro inserido com sucesso");
		

	}

}
