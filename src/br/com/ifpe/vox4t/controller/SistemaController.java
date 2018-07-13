package br.com.ifpe.vox4t.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import org.springframework.ui.Model;
import java.util.List;
import br.com.ifpe.vox4t.dao.UsuarioDAO;
import twitter4j.Status;
import twitter4j.TwitterException;

/**
 * @Author: rique.
 */

@Controller
public class SistemaController {
	
	@RequestMapping("home")
	public String index() {
		return "index";
	}
	
	@RequestMapping("testeTwitter")
	public String testeTwitter(Model model) throws TwitterException {
		UsuarioDAO user = new UsuarioDAO();
		List<Status> listaTweets = user.testeTwitter();
				
		model.addAttribute("listaTweets", listaTweets);
		return "testeTT";
	}

	@RequestMapping("/login/google")
	public String loginGoogle() {
		return "login/google";
	}
	
}
