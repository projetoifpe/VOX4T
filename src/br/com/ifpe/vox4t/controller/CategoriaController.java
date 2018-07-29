package br.com.ifpe.vox4t.controller;

import java.util.List;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.vox4t.model.Categoria;
import br.com.ifpe.vox4t.dao.CategoriaDAO;

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
		model.addAttribute("mensagem", "Categoria Incluída com Sucesso");

		return "categoria/cadastro";
	}
	

	@RequestMapping("/categoria/list")
	public String listarCategoria(Model model) {

		CategoriaDAO dao = new CategoriaDAO();
		List<Categoria> lista = dao.listar(null);
		model.addAttribute("listaCategoria", lista);

		return "categoria/selecaoCategoria";
	}

	@RequestMapping("/categoria/edit")
	public String edit(@RequestParam("id") Integer id, Model model) {

		CategoriaDAO dao = new CategoriaDAO();
		Categoria categoria = dao.buscarPorId(id);
		model.addAttribute("categoria", categoria);

		return "categoria/alterar";
	}

	@RequestMapping("/categoria/update")
	public String update(Categoria categoria, Model model) {

		CategoriaDAO dao = new CategoriaDAO();
		dao.alterar(categoria);
		model.addAttribute("mensagem", "Usuário Alterado com Sucesso !");

		return "forward:list";
	}

	@RequestMapping("/categoria/delete")
	public String delete(@RequestParam("id") Integer id, Model model) {

		CategoriaDAO dao = new CategoriaDAO();
		dao.remover(id);
		model.addAttribute("msg", "Categoria Removida com Sucesso");

		return "forward:add";
	}
	
	
}