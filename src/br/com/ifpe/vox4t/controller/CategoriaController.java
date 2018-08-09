package br.com.ifpe.vox4t.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	public String save(Categoria categoria, Model model,HttpSession session) {
		String link = "/VOX4T/categoria/add";
		CategoriaDAO dao = new CategoriaDAO();
		dao.salvar(categoria);
		model.addAttribute("msg", "Categoria Incluída com Sucesso");  //envia menssagem de confirmação.
		session.setAttribute("link", link);

		return "comum/pageMsg";
	}
	

	@RequestMapping("/categoria/list")
	public String listarCategoria(Model model) {

		CategoriaDAO dao = new CategoriaDAO();
		List<Categoria> lista = dao.listar();
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
	public String update(Categoria categoria, Model model, HttpSession session) {
		String link = "/VOX4T/categoria/add";
		CategoriaDAO dao = new CategoriaDAO();
		dao.alterar(categoria);
		model.addAttribute("msg", "Categoria Alterada com Sucesso !");  //envia menssagem de confirmação.
		session.setAttribute("link", link);
		return "comum/pageMsg";
	}


	@RequestMapping("/categoria/delete")
	public String delete(@RequestParam("id") Integer id, Model model,HttpSession session) {
		String link = "/VOX4T/categoria/add";
		CategoriaDAO dao = new CategoriaDAO();
		dao.remover(id);
		model.addAttribute("msg", "Categoria Removida com Sucesso"); // envia menssagem de confirmação.
		session.setAttribute("link", link);
		return "comum/pageMsg";
	}
	
	
	@RequestMapping("/categoria/select")
	public String selectCategoria(Model model) {

		CategoriaDAO dao = new CategoriaDAO();
		List<Categoria> lista = dao.listar();
		model.addAttribute("listaCategoria", lista);
		

		return "categoria/selecaoCategoria"; // Lista todas as categorias na página cadastro.
	}
	
	
	
	
	
}