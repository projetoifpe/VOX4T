package br.com.ifpe.vox4t.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.ifpe.vox4t.dao.UsuarioDAO;
import br.com.ifpe.vox4t.model.Usuario;

/**
 * @Author: henrique
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

		attr.addAttribute("msgSucesso", "Usuario adcionado com sucesso."); // Envia string msg para o html.
		dao.fecharConexao();
		return "usuario/cadastro";
	}
	
	
	@RequestMapping("/usuario/facebook")
	@ResponseBody
	public String loginUsuario(@RequestParam("nome") String nome,@RequestParam("email") String email,HttpSession session) {
		Boolean retorno = false;
		Usuario usuarioFacebook = new Usuario();
		usuarioFacebook.setNome(nome);
		usuarioFacebook.setEmail(email);
		UsuarioDAO dao = new UsuarioDAO();

		if(dao.buscarPorEmail(email) == null) {
			
			dao.salvar(usuarioFacebook);
			session.setAttribute("usuarioLogado", usuarioFacebook);
			retorno = true;
		}else {
			session.setAttribute("usuarioLogado", usuarioFacebook);
			retorno = true;
		}
		
		dao.fecharConexao();
		
		return retorno.toString();
	}
	
	@RequestMapping("/usuario/google")
	@ResponseBody
	public String loginGoogle(@RequestParam("nome") String nome,@RequestParam("email") String email,HttpSession session) {
		Boolean retorno = false;
		Usuario usuarioGoogle = new Usuario();
		usuarioGoogle.setNome(nome);
		usuarioGoogle.setEmail(email);
		UsuarioDAO dao = new UsuarioDAO();

		if(dao.buscarPorEmail(email) == null) {
			
			dao.salvar(usuarioGoogle);
			session.setAttribute("usuarioLogado", usuarioGoogle);
			retorno = true;
		}else {
			session.setAttribute("usuarioLogado", usuarioGoogle);
			retorno = true;
		}
		
		dao.fecharConexao();
		
		return retorno.toString();
	}
	
	@RequestMapping("/usuario/logadoFacebook")
	public String logadoFacebook() {

		return "logado";
	}
	
	@RequestMapping("/usuario/logadoGoogle")
	public String logadoGoogle() {

		return "logado";
	}
	
	
	@RequestMapping("loginCheck")
	public String loginCheck(@RequestParam("email") String emailUsuario,@RequestParam("senha") String senhaUsuario, Model attr, HttpSession session) {
		
		
		boolean result = false;
		UsuarioDAO dao = new UsuarioDAO();
		result = dao.logar(emailUsuario,senhaUsuario);
		
		if (result == true) {
			attr.addAttribute("msg", "Usuario Logado com sucesso."); // Envia string msg para o html.
			Usuario usuario = dao.buscarPorEmail(emailUsuario);
			session.setAttribute("usuarioLogado", usuario);
			dao.fecharConexao();
			return "logado";
		}
		else {
			dao.fecharConexao();
			attr.addAttribute("msg", "Usuario ou senha incorretos."); // Envia string msg para o html.
			return "logado";
		}
		
		
		
	}
	
	@RequestMapping("/usuario/disponivel")
	@ResponseBody
	public String emailDisponivel(@RequestParam("email") String email, UsuarioDAO user) {
		
		Boolean disponivel = user.buscarPorEmail(email) == null;
		user.fecharConexao();
		return disponivel.toString();
	}

}
