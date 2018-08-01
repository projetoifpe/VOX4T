package br.com.ifpe.vox4t.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.vox4t.dao.TwitterDAO;
import br.com.ifpe.vox4t.util.TratamentoPublicacao;
import twitter4j.Status;
import twitter4j.TwitterException;

/**
 * @Author: rique.
 */

@Controller
public class SistemaController {
	
	@RequestMapping("exibicao")
	public String testeTwitter(Model model) throws TwitterException {
		TwitterDAO user = new TwitterDAO();
		
		List<List<Status>> listaTweets = user.coletaTweets();
		List<String> publicacoes = new ArrayList<>();
		
		List<String> nomes = new ArrayList<>();
		for (int i = 0; i < listaTweets.size(); i++) {
			nomes.add(listaTweets.get(i).get(0).getUser().getName());
			for(Status a: listaTweets.get(i)){
				if(a.getText().startsWith("RT") || a.getText().startsWith("@")){
					continue;
				}else {
					String tt = a.getText();									
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
		}
		
		List<String> publiFinal = TratamentoPublicacao.converterAbreviacao(publicacoes);
		
		model.addAttribute("canais", nomes);
		model.addAttribute("publicacoes", publiFinal);
		return "exibicao";
	}

	@RequestMapping("/login/google")
	public String loginGoogle() {
		return "login/google";
	}
	
}
