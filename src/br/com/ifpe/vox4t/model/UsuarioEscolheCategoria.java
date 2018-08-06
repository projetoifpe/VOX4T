package br.com.ifpe.vox4t.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
	@Author: rique
*/
 

@Entity
@Table(name="usuario_escolhe_categoria")
public class UsuarioEscolheCategoria {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario idUsuario;
	
	@ManyToOne
	@JoinColumn(name="id_categoria")
	private Categoria idCategoria;

	
//-------------------------GETTERS AND SETTERS----------------------------------------------------------------------
	
	public UsuarioEscolheCategoria(){
		
	}
	
	/*public UsuarioEscolheCategoria(Object[] columns){
		this.id = (columns[0] != null) ? ((int)columns[0]):0;
		this.idUsuario = (columns[1] != null) ? ((int)columns[1]):0;
		this.idCategoria = (columns[2] != null) ? ((int)columns[2]):0;
	}*/
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Usuario getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Usuario idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Categoria getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(Categoria idCategoria) {
		this.idCategoria = idCategoria;
	}
	
	
	
}

