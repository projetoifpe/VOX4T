package br.com.ifpe.vox4t.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.vox4t.dao.UsuarioDAO;
import br.com.ifpe.vox4t.model.Usuario;

/**
	@Author: rique
*/

@Controller
public class UsuarioController {
	
	@RequestMapping("/usuario/cadastro")
	public String cadastroUsuario() {
		
		return "usuario/cadastro";
	}
	
	@RequestMapping("/usuario/save")
	public String save(Usuario usuario, Model attr) {

		UsuarioDAO dao = new UsuarioDAO();
		dao.salvar(usuario);
		
		attr.addAttribute("msgSucesso", "Usuario adcionado com sucesso."); //Envia string msg para o html.

		return "usuario/cadastro";
	}
}

