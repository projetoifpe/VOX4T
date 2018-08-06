package br.com.ifpe.vox4t.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TransactionRequiredException;

import org.springframework.transaction.annotation.Transactional;

import br.com.ifpe.vox4t.model.Categoria;
import br.com.ifpe.vox4t.model.Usuario;
import br.com.ifpe.vox4t.model.UsuarioEscolheCategoria;

/**
	@Author: rique
*/

public class UsuarioEscolheCategoriaDAO {
	
	
	private static final String PERSISTENCE_UNIT = "vox4t";
	
	public boolean salvar(int idUsuario, int idCategoria) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		UsuarioEscolheCategoria userchoose = new UsuarioEscolheCategoria();
		UsuarioDAO daoU = new UsuarioDAO();
		CategoriaDAO daoC = new CategoriaDAO();
		
		Usuario user = daoU.buscarPorId(idUsuario);
		Categoria cat = daoC.buscarPorId(idCategoria);
		
		
		userchoose.setIdCategoria(cat);
		userchoose.setIdUsuario(user);
		
		try {
			manager.getTransaction().begin();
			manager.persist(userchoose);
			manager.getTransaction().commit();
			
			manager.close();
			factory.close();
			
			return true;

		}catch(Exception e) {
			return false;
		}
			
	}
	
	
	/*public UsuarioEscolheCategoria buscarPorId(int idUsuario, int idCategoria) {
		
	}*/

	@Transactional
	public Boolean remover(int idUsuario, int idCategoria) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		String hqlStr = "delete from UsuarioEscolheCategoria where idUsuario = ? and idCategoria = ?";
		
		Query query = manager.createQuery("DELETE from UsuarioEscolheCategoria WHERE idUsuario = ?1 and idCategoria = ?2");
		query.setParameter(1, idUsuario);
		query.setParameter(2, idCategoria);
		
		int result = query.executeUpdate();
		
		try {
			return result > 0;
			
		}catch(Exception e) {
			System.out.println(result);
			
			return false;
		}
					
}

}