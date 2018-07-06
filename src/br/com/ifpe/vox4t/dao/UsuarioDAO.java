package br.com.ifpe.vox4t.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

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

	public boolean logar(Usuario usuario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Usuario");
		/*
		WHERE email = :paramEmail AND senha = :paramSenha"
		query.setParameter("paramEmail", email);
		query.setParameter("paramSenha", senha);
		*/
		System.out.println(usuario.getEmail());
		List<Usuario> lista = query.getResultList();
		manager.close();
		factory.close();
		
		if (lista.size() > 0) {
			return true;
		} else {
			return false;
		}
	
	}
/*
	 
	public Usuario logar(String email,String password){
		DetachedCriteria detachedCriteria =  DetachedCriteria.forClass(Usuario.class);
		detachedCriteria.add(Restrictions.eq("email", email));
		detachedCriteria.add(Restrictions.eq("senha", password));
		List<Usuario> findByCriteria = (List<Usuario>) hibernateTemplate.findByCriteria(detachedCriteria);
		if(findByCriteria !=null && findByCriteria.size()>0)
		return findByCriteria.get(0);
		else
			return null;
}
*/

}
