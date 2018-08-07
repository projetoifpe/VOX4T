package br.com.ifpe.vox4t.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.ifpe.vox4t.dao.CategoriaDAO;
import br.com.ifpe.vox4t.dao.UsuarioEscolheCategoriaDAO;
import br.com.ifpe.vox4t.model.Categoria;

/**
 * @Author: Hermes.Neto - vox4t;
 */

@Controller
public class CategoriaController {

	@RequestMapping("/categoria/add")
	public String add(Model model) {

		return "categoria/cadastro";
	}

	@RequestMapping("/categoria/save")
	public String save(Categoria categoria, Model model) {

		CategoriaDAO dao = new CategoriaDAO();
		dao.salvar(categoria);
		model.addAttribute("msg", "Categoria Incluída com Sucesso");  //envia menssagem de confirmação.

		return "categoria/cadastro"; // inclui uma categoria.
	}
	

	@RequestMapping("/categoria/list")
	public String listarCategoria(Model model) {

		CategoriaDAO dao = new CategoriaDAO();
		List<Categoria> lista = dao.listar(null);
		model.addAttribute("listaCategoria", lista);

		return "categoria/listaCategoria"; // Lista todas as categorias na página cadastro.
	}

	@RequestMapping("/categoria/edit")
	public String edit(@RequestParam("id") Integer id, Model model) {
		
		CategoriaDAO dao = new CategoriaDAO();
		Categoria categoria = dao.buscarPorId(id);
		model.addAttribute("categoria", categoria);

		return "categoria/alterar"; // Envia o id da categoria para o modal alterar.
		}
	
	@RequestMapping("/categoria/update")
	public String update(Categoria categoria, Model model) {

		CategoriaDAO dao = new CategoriaDAO();
		dao.alterar(categoria);
		model.addAttribute("msg", "Categoria Alterada com Sucesso !");  //envia menssagem de confirmação.

		return "categoria/cadastro"; // Atualiza o nome da categoria e envia para a pagina de cadastro.
	}


	@RequestMapping("/categoria/delete")
	public String delete(@RequestParam("id") Integer id, Model model) {

		CategoriaDAO dao = new CategoriaDAO();
		dao.remover(id);
		model.addAttribute("msg", "Categoria Removida com Sucesso"); // envia menssagem de confirmação.

		return "forward:add";// Exclui a categoria informada pelo id.
	}
	
	@RequestMapping("/categoria/select")
	public String selectCategoria(Model model) {

		CategoriaDAO dao = new CategoriaDAO();
		List<Categoria> lista = dao.listar(null);
		model.addAttribute("listaCategoria", lista);
		

		return "categoria/selecaoCategoria"; // Lista todas as categorias na página cadastro.
	}
	
	
	@RequestMapping("/categoria/userselect") // Usuário adciona categoria selecionada
	@ResponseBody
	public String categoriaSelecionada(@RequestParam("idUsuario") int idUsuario, @RequestParam("idCategoria") int idCategoria,
			UsuarioEscolheCategoriaDAO userCatDao) {
		
		
		if(userCatDao.salvar(idUsuario, idCategoria)) {
			
			Boolean sucesso = true;
			
			return sucesso.toString();
		}
		
		return "false";
		
		
	}
	
	
	@RequestMapping("/categoria/userunselect") // Usuário adciona categoria selecionada
	@ResponseBody
	public String categoriaDesSelecionada(@RequestParam("idUsuario") int idUsuario, @RequestParam("idCategoria") int idCategoria) {
		
		UsuarioEscolheCategoriaDAO userCatDao = new UsuarioEscolheCategoriaDAO();
		
		if(userCatDao.remover(idUsuario, idCategoria)) {
			
			Boolean sucesso = true;
			
			return sucesso.toString();
		}
		
		return "false";
		
		
}
	
	
}