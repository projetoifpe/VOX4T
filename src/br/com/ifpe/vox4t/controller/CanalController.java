package br.com.ifpe.vox4t.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.vox4t.dao.CanalDAO;
import br.com.ifpe.vox4t.dao.CategoriaDAO;
import br.com.ifpe.vox4t.model.Canal;
import br.com.ifpe.vox4t.model.Categoria;

/**
 * @Author: wildici
 */

@Controller
public class CanalController {

	@RequestMapping("/canal/incluirCanal")
	public String add(Model model) {

		//Código para pular o combo de categoria
		CategoriaDAO dao = new CategoriaDAO();
		List<Categoria> listaCategoria = dao.listar();
		model.addAttribute("listaCategoria", listaCategoria);
		
		return "canal/incluirCanal";
	}

	@RequestMapping("/canal/saveCanal")
	public String saveCanal(Canal canal, Model model) {

		CanalDAO dao = new CanalDAO();
		dao.salvar(canal);
		model.addAttribute("msg", "Canal cadastrado com sucesso!");
		
		//Código para pular o combo de categoria
		CategoriaDAO daoo = new CategoriaDAO();
		List<Categoria> listaCategoria = daoo.listar();
		model.addAttribute("listaCategoria", listaCategoria);

		return "canal/incluirCanal";
	}

	@RequestMapping("/canal/list")
	public String listaCanal(Model model) {

		CanalDAO dao = new CanalDAO();
		List<Canal> lista = dao.listar(null);
		model.addAttribute("listaCanal", lista);
		return "canal/listaCanal";
	}

	@RequestMapping("/canal/edit")
	public String edit(@RequestParam("id") Integer id, Model model) {

		CanalDAO dao = new CanalDAO();
		Canal canal = dao.buscarPorId(id);
		model.addAttribute("canal", canal);
		

		//Código para pular o combo de categoria
		CategoriaDAO daoo = new CategoriaDAO();
		List<Categoria> listaCategoria = daoo.listar();
		model.addAttribute("listaCategoria", listaCategoria);

		return "canal/alterarCanal";
	}

	@RequestMapping("/canal/update")
	public String update(Canal canal, Model model) {

		CanalDAO dao = new CanalDAO();
		dao.alterar(canal);
		model.addAttribute("msg", "Canal alterado com sucesso!");
		
		//Código para pular o combo de categoria
		CategoriaDAO daoo = new CategoriaDAO();
		List<Categoria> listaCategoria = daoo.listar();
		model.addAttribute("listaCategoria", listaCategoria);

		return "canal/incluirCanal";
	}

	@RequestMapping("/canal/delete")
	public String delete(@RequestParam("id") Integer id, Model model) {

		CanalDAO dao = new CanalDAO();
		dao.remover(id);
		model.addAttribute("msg", "Canal removido com sucesso!");

		return "forward:incluirCanal";
	}

}
