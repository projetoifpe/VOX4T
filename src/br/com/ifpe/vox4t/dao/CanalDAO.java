package br.com.ifpe.vox4t.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

import br.com.ifpe.vox4t.model.Canal;
import br.com.ifpe.vox4t.model.Categoria;

public class CanalDAO {

	private EntityManagerFactory factory = null;
	private EntityManager manager = null;
	private static final String PERSISTENCE_UNIT = "vox4t";

	public void salvar(Canal canal) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(canal);
		manager.getTransaction().commit();
	}

	public List<Canal> listar(Canal canal) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Canal ORDER BY nome");
		List<Canal> lista = query.getResultList();
		return lista;
	}

	public Canal buscarPorId(int id) {
		Canal obj = null;
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Canal.class, id);
		return obj;
	}

	public void alterar(Canal canal) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(canal);
		manager.getTransaction().commit();

	}

	public void remover(int id) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Canal canal = manager.find(Canal.class, id);
		manager.getTransaction().begin();
		manager.remove(canal);
		manager.getTransaction().commit();
	}

	public void fecharConexao() {
		this.manager.close();
		this.factory.close();
	}

}
