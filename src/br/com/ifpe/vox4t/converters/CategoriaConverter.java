package br.com.ifpe.vox4t.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.vox4t.model.Categoria;
import br.com.ifpe.vox4t.dao.CategoriaDAO;

public class CategoriaConverter implements Converter<String, Categoria> {
	
    public Categoria convert(String id) {

	CategoriaDAO dao = new CategoriaDAO();
	return dao.buscarPorId(Integer.valueOf(id));
    }

}
