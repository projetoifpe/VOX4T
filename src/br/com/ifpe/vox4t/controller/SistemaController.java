package br.com.ifpe.vox4t.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.vox4t.dao.TwitterDAO;
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
	
	@RequestMapping("exibicao")
	public String testeTwitter(Model model) throws TwitterException {
		TwitterDAO user = new TwitterDAO();
		
		List<Status> listaTweets = user.coletaTweets();
		List<String> publicacoes = new ArrayList<>();
		
		String nome = listaTweets.get(0).getUser().getName();
		
		for(Status a: listaTweets){
			if((!String.valueOf(a.getText().charAt(0)).equals("R") && !String.valueOf(a.getText().charAt(1)).equals("T"))){	
					String tt = a.getText();
					String data = a.getCreatedAt().getHours() + ":" + a.getCreatedAt().getMinutes() + ":" + a.getCreatedAt().getSeconds();				System.out.println(data);
									
					try {
						String ntt = tt.substring(0, tt.indexOf("https"));
						publicacoes.add(ntt);
					}catch(Exception e) {
						try {
							String ntt = tt.substring(0, tt.indexOf("goo.gl"));
							publicacoes.add(ntt);
						}catch(Exception e2) {
							publicacoes.add(a.getText());
						}
					}
			}
		}
		
		model.addAttribute("canal", nome);
		model.addAttribute("publicacao", publicacoes);
		return "exibicao";
	}

	@RequestMapping("/login/google")
	public String loginGoogle() {
		return "login/google";
	}
	
}
