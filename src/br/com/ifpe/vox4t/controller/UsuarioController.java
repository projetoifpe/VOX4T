package br.com.ifpe.vox4t.controller;

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
	public String edicaoUsuario() {

		return "usuario/edicaoUsuario";
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
			session.setAttribute("usuarioLogado", usuarioFacebook);
			retorno = true;
		} else {
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
			session.setAttribute("usuarioLogado", usuarioGoogle);
			retorno = true;
		} else {
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

	public String loginCheck(Usuario usuario, Model attr, HttpSession session) {

		boolean result = false;

		UsuarioDAO dao = new UsuarioDAO();
		usuario.setSenha(Criptografia.criptografar(usuario.getSenha()));
		result = dao.logar(usuario);

		if (result == true) {
			String link = "/VOX4T/exibicao";
			attr.addAttribute("msg", "Usuario Logado com sucesso."); // Envia string msg para o html.
			session.setAttribute("link", link);
			Usuario user = dao.buscarPorEmail(usuario.getEmail());
			session.setAttribute("usuarioLogado", user);
			dao.fecharConexao();
			return "comum/pageMsg";}

		else {
			String link = "/VOX4T";
			dao.fecharConexao();
			session.setAttribute("link", link);
			attr.addAttribute("msg", "Usuario ou senha incorretos."); // Envia string msg para o html.
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

}
