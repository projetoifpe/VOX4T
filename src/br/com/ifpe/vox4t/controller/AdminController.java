package br.com.ifpe.vox4t.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.ifpe.vox4t.dao.AdminDAO;
import br.com.ifpe.vox4t.model.Admin;
import br.com.ifpe.vox4t.util.Criptografia;

@Controller
public class AdminController {

	 @RequestMapping("admin")
     public String admin() {
         return "admin/loginAdmin";
     }
	 
		@RequestMapping("loginAdminCheck")
		public String loginAdminCheck(Admin adm, Model attr, HttpSession session) {
			
			boolean result = false;
			
			AdminDAO dao = new AdminDAO();
			result = dao.logar(adm);
			
			if (result == true) {
				attr.addAttribute("msg", "Administrador Logado com sucesso.");
				Admin admin = dao.buscarPorEmail(adm.getEmail());
				session.setAttribute("adminLogado", admin);
				return "admin/menu";
			}
			else {
				attr.addAttribute("msg", "E-mail ou senha incorreto(s)");
				return "admin/loginAdmin";
			}
		}
		 
		 @RequestMapping("logout")
	     public String logout(HttpSession session) {
	         session.invalidate();
	         return "admin/loginAdmin";
	     }
		 
		 @RequestMapping("admin/menu")
	     public String adminUsuario() {
	         return "admin/menu";
	     }
		 
		 @RequestMapping("admin/gerenciar-usuario")
	     public String adminGerenciaUsuario() {
	         return "admin/gerenciaUsuario";
	     }

}
