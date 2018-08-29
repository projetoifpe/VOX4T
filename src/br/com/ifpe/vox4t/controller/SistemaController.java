package br.com.ifpe.vox4t.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.ifpe.vox4t.dao.CategoriaDAO;
import br.com.ifpe.vox4t.dao.TwitterDAO;
import br.com.ifpe.vox4t.dao.UsuarioEscolheCategoriaDAO;
import br.com.ifpe.vox4t.model.Categoria;
import br.com.ifpe.vox4t.model.Usuario;
import br.com.ifpe.vox4t.model.UsuarioEscolheCategoria;
import br.com.ifpe.vox4t.util.TratamentoPublicacao;
import twitter4j.Status;
import twitter4j.TwitterException;

/** 
 * @Author: rique.
 */

@Controller
public class SistemaController {
	
	@RequestMapping("testevoz")
	public String testeVoz() {
		
		return "testevoz";
	}
	
	@RequestMapping("exibicao")
	public String testeTwitter(HttpSession session, Model model) throws TwitterException {
		
		TwitterDAO user = new TwitterDAO();
		
		Usuario usu = (Usuario)session.getAttribute("usuarioLogado");
		
		List<List<Status>> listaTweets = user.coletaTweets(usu.getId());
		List<List<String>> publicacoes = new ArrayList<>();
		List<String> lista = new ArrayList<>();

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
						lista.add(ntt);
					}catch(Exception e) {
						try {
							String ntt = tt.substring(0, tt.indexOf("goo.gl"));
							lista.add(ntt);
						}catch(Exception e2) {
							lista.add(a.getText());
						}
					}
				}	
					
				
			}
			
			List<String> lista2 = new ArrayList<>(lista);
			lista2 = TratamentoPublicacao.converterAbreviacao(lista);
			publicacoes.add(lista2);
			lista.clear();
			
		}
		
		CategoriaDAO dao3 = new CategoriaDAO();
		List<Categoria> categorias =  dao3.listar();
		
		UsuarioEscolheCategoriaDAO uecdao = new UsuarioEscolheCategoriaDAO();
		List<UsuarioEscolheCategoria> categoriasUsuario = uecdao.listar(usu.getId());
		
		for(Categoria y: categorias) {
			System.out.println(y.getId());
		}
		
		System.out.println("");
		
		for(UsuarioEscolheCategoria x: categoriasUsuario) {
			System.out.println(x.getIdCategoria().getId());
		}
		
		model.addAttribute("categoriasUsuario", categoriasUsuario);
		model.addAttribute("listaCategoria", categorias);
		model.addAttribute("canais", nomes);
		model.addAttribute("publicacoes", publicacoes);
		return "exibicao";
	}

	@RequestMapping("/login/google")
	public String loginGoogle() {
		return "login/google";
	}
	
	@RequestMapping("/sobre")
	public String sobre() {
		return "comum/sobre";
	}
	
	
	@RequestMapping("userselect") // Usuário adciona categoria selecionada
	@ResponseBody
	public String categoriaSelecionada(@RequestParam("idUsuario") int idUsuario, @RequestParam("idCategoria") int idCategoria,
			UsuarioEscolheCategoriaDAO userCatDao) {
		
		
		if(userCatDao.salvar(idUsuario, idCategoria)) {
			
			Boolean sucesso = true;
			
			return sucesso.toString();
		}
		
		return "false";
		
		
	}
	
	
	@RequestMapping("userunselect") // Usuário adciona categoria selecionada
	@ResponseBody
	public String categoriaDesSelecionada(@RequestParam("idUsuario") int idUsuario, @RequestParam("idCategoria") int idCategoria) {
		
		UsuarioEscolheCategoriaDAO userCatDao = new UsuarioEscolheCategoriaDAO();
		
		if(userCatDao.remover(idUsuario, idCategoria)) {
			
			Boolean sucesso = true;
			
			return sucesso.toString();
		}
		
		return "false";
		
		
}
	
}
