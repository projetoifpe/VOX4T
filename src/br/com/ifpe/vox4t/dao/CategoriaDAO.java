package br.com.ifpe.vox4t.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import br.com.ifpe.vox4t.model.Categoria;

public class CategoriaDAO {
	private static final String PERSISTENCE_UNIT = "vox4t";

	public void salvar(Categoria categoria) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(categoria);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

	public List<Categoria> listar(Categoria categoria) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM Categoria ORDER BY nome");
		List<Categoria> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}

		public Categoria buscarPorId(int id) {
		Categoria obj = null;
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Categoria.class, id);
		manager.close();
		factory.close();
		return obj;
	}

	public void alterar(Categoria categoria) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(categoria);
		manager.getTransaction().commit();
		manager.close();
		factory.close();

	}
	public void remover(int id) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Categoria categoria = manager.find(Categoria.class, id);
		manager.getTransaction().begin();
		manager.remove(categoria);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}

}