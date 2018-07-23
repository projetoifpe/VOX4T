package br.com.ifpe.vox4t.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
	
	@Column(name="id_usuario")
	private int idUsuario;
	
	@Column(name="id_categoria")
	private int idCategoria;

	
//-------------------------GETTERS AND SETTERS----------------------------------------------------------------------

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public int getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}
	
	
	
}

