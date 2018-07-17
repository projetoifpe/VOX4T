package br.com.ifpe.vox4t.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		List<String> publicacoes = new ArrayList<>();
		
		String nome = listaTweets.get(0).getUser().getName();
		System.out.println(nome);
		
		for(Status a: listaTweets){
			if((!String.valueOf(a.getText().charAt(0)).equals("R") && !String.valueOf(a.getText().charAt(1)).equals("T"))){
				if(!String.valueOf(a.getText().charAt(0)).equals("@")) {
					
					String tt = a.getText();
					
					try {
						String ntt = tt.substring(0, tt.indexOf("goo.gl"));
						publicacoes.add(ntt);
					}catch(Exception e) {
						try {
							String ntt = tt.substring(0, tt.indexOf("https"));
							publicacoes.add(ntt);
						}catch(Exception e2) {
							publicacoes.add(a.getText());
						}
					}
				} 
			}
		}
		
		model.addAttribute("canal", nome);
		model.addAttribute("publicacao", publicacoes);
		System.out.println(publicacoes.get(0));
		return "testeTT";
	}

	@RequestMapping("/login/google")
	public String loginGoogle() {
		return "login/google";
	}
	
}
