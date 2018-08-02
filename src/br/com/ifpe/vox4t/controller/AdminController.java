package br.com.ifpe.vox4t.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.ifpe.vox4t.dao.AdminDAO;
import br.com.ifpe.vox4t.model.Admin;

@Controller
public class AdminController {

	 @RequestMapping("admin")
     public String admin() {
         return "admin/loginAdmin";
     }
	 
		@RequestMapping("loginAdminCheck")
		public String loginAdminCheck(@RequestParam("email") String emailAdmin,@RequestParam("senha") String senhaAdmin, Model attr, HttpSession session) {
			
			boolean result = false;
			
			AdminDAO dao = new AdminDAO();
			result = dao.logar(emailAdmin,senhaAdmin);
			
			if (result == true) {
				attr.addAttribute("msg", "Administrador Logado com sucesso.");
				Admin admin = dao.buscarPorEmail(emailAdmin);
				session.setAttribute("adminLogado", admin);
				return "admin/logado";
			}
			else {
				attr.addAttribute("msg", "E-mail ou senha incorreto(s)");
				return "admin/loginAdmin";
			}
		}
		 
		 @RequestMapping("logout")
	     public String logout(HttpSession session) {
	         session.invalidate();
	         return "redirect:admin";
	     }
		 @RequestMapping("admin/menu")
	     public String adminUsuario() {
	         return "admin/menu";
	     }

}
