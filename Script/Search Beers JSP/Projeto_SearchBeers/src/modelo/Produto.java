package modelo;

public class Produto {
	
	private int id;
	private String nome;
	private String origem;
	private String fabricante;
	private int volume;
	private double preco;
	private  String teor_alcoolico;
	private String foto;
	private int usuario_codigo;

	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getOrigem() {
		return origem;
	}
	public void setOrigem(String origem) {
		this.origem = origem;
	}
	public String getFabricante() {
		return fabricante;
	}
	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}
	
	public int getVolume() {
		return volume;
	}
	public void setVolume(int volume) {
		this.volume = volume;
	}
	public double getPreco() {
		return preco;
	}
	public void setPreco(double preco) {
		this.preco = preco;
	}
	public String getTeor_alcoolico() {
		return teor_alcoolico;
	}
	public void setTeor_alcoolico(String teor_alcoolico) {
		this.teor_alcoolico = teor_alcoolico;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	
	public int getUsuario_codigo() {
		return usuario_codigo;
	}
	public void setUsuario_codigo(int usuario_codigo) {
		this.usuario_codigo = usuario_codigo;
	}

}
