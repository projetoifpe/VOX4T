package br.com.ifpe.vox4t.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

import br.com.ifpe.vox4t.model.Usuario;
import twitter4j.Status;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

/**
 * @Author: henrique
 */

public class UsuarioDAO {
	
	private EntityManagerFactory factory = null;
	private EntityManager manager = null;
	private static final String PERSISTENCE_UNIT = "vox4t";
	
	public UsuarioDAO(){
		 this.factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		 this.manager = this.factory.createEntityManager();
	}


	public void salvar(Usuario usuario) {
		
	   
		this.manager.getTransaction().begin();
		this.manager.persist(usuario);
		this.manager.getTransaction().commit();
		
		
	}


	public boolean logar(Usuario usuario) {
		
		Query query = null;
		query = manager.createQuery("FROM Usuario WHERE email = :paramEmail AND senha = :paramSenha AND status = :paramStatus");
		query.setParameter("paramEmail", usuario.getEmail());
		query.setParameter("paramSenha", usuario.getSenha());
		query.setParameter("paramStatus", 1);
		@SuppressWarnings("unchecked")
		List<Usuario> lista = query.getResultList();
		
		if (lista.size() > 0) {System.out.println("Encontrou");	return true;}
		
		else {System.out.println("Não encontrou");return false;}}
		
	
	
	public Usuario buscarPorEmail(String email) {

		Usuario obj = null;

		
		Query query = null;
		query = manager.createQuery("FROM Usuario WHERE email = :paramEmail");
		query.setParameter("paramEmail", email);
		
		try {
			obj = (Usuario) query.getSingleResult();
		}catch(NoResultException nre) {
			return null;
		}
		
		return obj;

	    }
	
	public Usuario verificarEmail(String email, Usuario user) {

		Usuario obj = null;

		
		Query query = null;
		query = manager.createQuery("FROM Usuario WHERE email = :paramEmail");
		query.setParameter("paramEmail", email);
		
		try {
			obj = (Usuario) query.getSingleResult();
			if(obj.getId()== user.getId()) {
				return null;
			}
		}catch(NoResultException nre) {
			return null;
		}
		
		return obj;

	    }
	
	
public Usuario buscarPorId(int id) {
		
		Usuario obj = null;
		
		Query query = null;
		query = manager.createQuery("FROM Usuario WHERE id = :paramId");
		query.setParameter("paramId", id);
		
		try {
			obj = (Usuario) query.getSingleResult();
		}catch(NoResultException nre) {
			return null;
		}
		
		return obj;
		
}


	
	public void fecharConexao() {
		this.manager.close();
		this.factory.close();
	}
	
	public List<Usuario> listar() {
	    Query query = null;
	    query = manager.createQuery("FROM Usuario ORDER BY nome");
	    @SuppressWarnings("unchecked")
	    List<Usuario> lista = query.getResultList();
	    return lista;
	}
	
	public void alterar(Usuario usuario) {
	    manager.getTransaction().begin();
	    manager.merge(usuario);
	    manager.getTransaction().commit();
	    }
	
	public void remover(int id) {

	    EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	    EntityManager manager = factory.createEntityManager();
	    Usuario user = manager.find(Usuario.class, id);

	    manager.getTransaction().begin();
	    manager.remove(user);
	    manager.getTransaction().commit();

	    manager.close();
	    factory.close();
	    }
	
}
