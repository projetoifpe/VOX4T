package br.com.ifpe.vox4t.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: rique.
 */

@Controller
public class SistemaController {

	@RequestMapping("home")
	public String index() {
		return "index";
	}

	/*@RequestMapping("cadastro")
	public String cadastro() {
		return "cadastro";
	}*/
}
