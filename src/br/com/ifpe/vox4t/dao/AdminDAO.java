package br.com.ifpe.vox4t.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

import br.com.ifpe.vox4t.model.Admin;

public class AdminDAO {
	
	private static final String PERSISTENCE_UNIT = "vox4t";
	
	public Admin buscarPorEmail(String email) {

		Admin obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Admin WHERE email = :paramEmail");
		query.setParameter("paramEmail", email);
		
		try {
			obj = (Admin) query.getSingleResult();
		}catch(NoResultException nre) {
			return null;
		}
		
		manager.close();
		factory.close();
		
		return obj;
	    
	}
	
	public boolean logar(String emailAdmin, String senhaAdmin) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Admin WHERE email = :paramEmail AND senha = :paramSenha");
		query.setParameter("paramEmail", emailAdmin);
		query.setParameter("paramSenha", senhaAdmin);
		@SuppressWarnings("unchecked")
		List<Admin> lista = query.getResultList();
		manager.close();
		factory.close();
		
		if (lista.size() > 0) {
			System.out.println("Encontrou");
			return true;
		} else {
			System.out.println("Não encontrou");
			return false;
		}
	
	}
	
}
