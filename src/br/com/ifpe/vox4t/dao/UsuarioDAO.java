package br.com.ifpe.vox4t.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import br.com.ifpe.vox4t.model.Usuario;

/**
 * @Author: rique
 */

public class UsuarioDAO {

	private static final String PERSISTENCE_UNIT = "vox4t";

	public void salvar(Usuario usuario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(usuario);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

	public boolean logar(String email, String senha) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("select nome FROM Usuario WHERE email = :paramEmail AND senha = :paramSenha");
		query.setParameter("paramEmail", email);
		query.setParameter("paramSenha", senha);
		List<Usuario> lista = query.getResultList();
		manager.close();
		factory.close();
		return true;
		//TENHO QUE ARRUMAR ESSA CONDICIONAL ABAIXO
		/*
		if (lista != null) {
			return false;
		} else {
			return true;
		}
		*/
	}

}
