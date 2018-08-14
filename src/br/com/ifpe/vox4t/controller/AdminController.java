package br.com.ifpe.vox4t.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.ifpe.vox4t.dao.AdminDAO;
import br.com.ifpe.vox4t.dao.UsuarioDAO;
import br.com.ifpe.vox4t.dao.UsuarioEscolheCategoriaDAO;
import br.com.ifpe.vox4t.model.Admin;
import br.com.ifpe.vox4t.model.Usuario;

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
				String link = "/VOX4T/admin/menu";
				attr.addAttribute("msg", "Administrador Logado com sucesso.");
				session.setAttribute("link", link);
				Admin admin = dao.buscarPorEmail(adm.getEmail());
				session.setAttribute("adminLogado", admin);
				return "comum/pageMsg";
			}
			else {
				String link = "/VOX4T/admin";
				attr.addAttribute("msg", "E-mail ou senha incorreto(s)");
				session.setAttribute("link", link);
				return "comum/pageMsg";
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
	     public String adminGerenciaUsuario(Model model) {
	         UsuarioDAO dao = new UsuarioDAO();
	         List<Usuario> listaUsuarios = dao.listar();
	         
	         model.addAttribute("usuarios", listaUsuarios);
			 
			 return "admin/gerenciaUsuario";
	     }
		 
		 @RequestMapping("admin/usuario-status-checked") // Usuário adciona categoria selecionada
			@ResponseBody
			public String statusUsuarioChecked(@RequestParam("status") int id) {
				
				UsuarioDAO user = new UsuarioDAO();
				Usuario userSta = new Usuario();
				
				userSta = user.buscarPorId(id);
				
				userSta.setStatus(1);
				
				user.alterar(userSta);
				
				return "true";
				
				
		}
		 
		 @RequestMapping("admin/usuario-status-unchecked") // Usuário adciona categoria selecionada
			@ResponseBody
			public String statusUsuarioUnchecked(@RequestParam("status") int id) {
				
				UsuarioDAO user = new UsuarioDAO();
				Usuario userSta = new Usuario();
				
				userSta = user.buscarPorId(id);
				
				userSta.setStatus(0);
				
				user.alterar(userSta);
				
				return "false";
				
				
		}
		 
		 @RequestMapping("/admin/excluirUsuario")
		    public String delete(@RequestParam("id") Integer id) {

		    UsuarioDAO dao = new UsuarioDAO();
		    dao.remover(id);
		    

		    return "forward:gerenciar-usuario";
		    
		 } 

}
