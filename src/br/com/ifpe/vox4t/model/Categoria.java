package br.com.ifpe.vox4t.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
@Author h.neto.
*/

@Entity
@Table(name="categoria")
public class Categoria {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_categoria")
	private int id;
	
	@Column
	private String nome;
	
	/*@Column(name = "id_administrador")
	private int id_adm;
	*/
//	-------------------GETTERS AND SETTERS------------------------------------------------------------------------
	
	
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
	/*public int getId_adm() {
		return id_adm;
	}
	public void setId_adm(int id_adm) {
		this.id_adm = id_adm;
	}*/
	
}
