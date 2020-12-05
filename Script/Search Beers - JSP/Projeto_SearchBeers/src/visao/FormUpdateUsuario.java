package visao;

import dao.DaoUsuario;
import modelo.Usuario;

public class FormUpdateUsuario {

	public static void main(String[] args) {
		
		
		Usuario usuario = new Usuario();
		DaoUsuario dao = new DaoUsuario();
		
		usuario.setNome("testealteracao");
		usuario.setLogin("testealteracao");
		usuario.setSenha("testealteracao");
		usuario.setEmail("testealteracao@");
		usuario.setPerfil("administrador");
		usuario.setCodigo(57);
		
		dao.update(usuario);
		
		System.out.println("Usuário Alterado com Sucesso");
		
		
		

	}

}
