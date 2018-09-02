package br.com.ifpe.vox4t.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.ifpe.vox4t.dao.UsuarioDAO;
import br.com.ifpe.vox4t.model.Usuario;
import br.com.ifpe.vox4t.util.Criptografia;

@Controller
public class UsuarioController {

	@RequestMapping("/usuario/cadastro")
	public String cadastroUsuario() {

		return "usuario/cadastro";   
	}
	
	@RequestMapping("/usuario/edicaoUsuario")
	public String edicaoUsuario(@RequestParam("id") Integer id, Model model) {
		
		UsuarioDAO dao = new UsuarioDAO();
		Usuario usuario = dao.buscarPorId(id);
		model.addAttribute("usuario", usuario);

		return "usuario/edicaoUsuario";
	}
	
	 @RequestMapping("/usuario/update")
	    public String update(Usuario usuario, Model attr , @RequestParam("senhaNova") String senhaNova, HttpSession session) {
		 
		 if (!senhaNova.equals(usuario.getSenha()) && !senhaNova.equals("")) {
			    usuario.setSenha(Criptografia.criptografar(senhaNova));
			}
		 
		UsuarioDAO dao = new UsuarioDAO();
		dao.alterar(usuario);
		dao.fecharConexao();
		session.setAttribute("usuarioLogado", usuario);
		String link = "/VOX4T/exibicao";
		attr.addAttribute("link", link);
		attr.addAttribute("msg", "Usuario alterado com sucesso."); // Envia string msg para o html.
		return "comum/pageMsg";
	    }

	@RequestMapping("/usuario/save")
	public String save(Usuario usuario, Model attr, HttpSession session) {
		usuario.setSenha(Criptografia.criptografar(usuario.getSenha()));
		UsuarioDAO dao = new UsuarioDAO();
		dao.salvar(usuario);
		String link = "/VOX4T";
		attr.addAttribute("msg", "Usuario adcionado com sucesso."); // Envia string msg para o html.
		session.setAttribute("link", link);
		dao.fecharConexao();
		return "comum/pageMsg";
	}

	@RequestMapping("/usuario/facebook")
	@ResponseBody
	public String loginUsuario(@RequestParam("nome") String nome, @RequestParam("email") String email,
			HttpSession session) {
		Boolean retorno = false;
		Usuario usuarioFacebook = new Usuario();
		usuarioFacebook.setNome(nome);
		usuarioFacebook.setEmail(email);
		UsuarioDAO dao = new UsuarioDAO();

		if (dao.buscarPorEmail(email) == null) {

			dao.salvar(usuarioFacebook);
			usuarioFacebook.setId(dao.buscarPorEmail(email).getId());
			session.setAttribute("usuarioLogado", usuarioFacebook);
			retorno = true;
		} else {
			usuarioFacebook.setId(dao.buscarPorEmail(email).getId());
			session.setAttribute("usuarioLogado", usuarioFacebook);
			retorno = true;
		}

		dao.fecharConexao();

		return retorno.toString();
	}

	@RequestMapping("/usuario/google")
	@ResponseBody
	public String loginGoogle(@RequestParam("nome") String nome, @RequestParam("email") String email,
		HttpSession session) {
		Boolean retorno = false;
		Usuario usuarioGoogle = new Usuario();
		usuarioGoogle.setNome(nome);
		usuarioGoogle.setEmail(email);
		UsuarioDAO dao = new UsuarioDAO();
		

		if (dao.buscarPorEmail(email) == null) {

			dao.salvar(usuarioGoogle);
			usuarioGoogle.setId(dao.buscarPorEmail(email).getId());
			session.setAttribute("usuarioLogado", usuarioGoogle);
			retorno = true;
		} else {
			usuarioGoogle.setId(dao.buscarPorEmail(email).getId());
			session.setAttribute("usuarioLogado", usuarioGoogle);
			retorno = true;
		}

		dao.fecharConexao();

		return retorno.toString();
	}

	@RequestMapping("/usuario/logadoFacebook")
	public String logadoFacebook() {

		return "forward:/exibicao";
	}
	
	@RequestMapping("home")
	public String entrar() {

		return "index";
	}

	@RequestMapping("/usuario/logadoGoogle")
	public String logadoGoogle() {

		return "forward:/exibicao";
	}

	@RequestMapping("loginCheck")

	public String loginCheck(Usuario usuario, HttpSession session,  Model model) {

		boolean result = false;

		UsuarioDAO dao = new UsuarioDAO();
		usuario.setSenha(Criptografia.criptografar(usuario.getSenha()));
		result = dao.logar(usuario);

		if (result == true) {
			Usuario user = dao.buscarPorEmail(usuario.getEmail());
			session.setAttribute("usuarioLogado", user);
			dao.fecharConexao();
			return "forward:/exibicao";}

		else {
			String link = "/VOX4T";
			model.addAttribute("msg", "Senha ou usuário incorretos."); // Envia string msg para o html.
			model.addAttribute("link", link);
			dao.fecharConexao();
			return "comum/pageMsg";

		}
	}

	@RequestMapping("/usuario/disponivel")
	@ResponseBody
	public String emailDisponivel(@RequestParam("email") String email, UsuarioDAO user) {

		Boolean disponivel = user.buscarPorEmail(email) == null;
		user.fecharConexao();
		return disponivel.toString();
	}
	
	@RequestMapping("/usuario/verificarEmail")
	@ResponseBody
	public String verificarEmail(@RequestParam("email") String email,UsuarioDAO user,HttpServletRequest session) {

		Usuario usuario = (Usuario) session.getSession().getAttribute("usuarioLogado");
		Boolean disponivel = (user.verificarEmail(email, usuario) == null);
		user.fecharConexao();
		return disponivel.toString();
	}
	
	@RequestMapping("/usuario/logout")
    public String logoutUsuario(HttpSession session, Model model) {
		String link = "/VOX4T";
		session.invalidate();
		model.addAttribute("msg", "usuário deslogado."); // Envia string msg para o html.
		model.addAttribute("link", link);
        return "comum/pageMsg";
    }
}
	/////////////////////////////////////////////////////////////////////////////////