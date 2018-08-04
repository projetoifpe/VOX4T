package br.com.ifpe.vox4t.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {
	
@Override
public boolean preHandle(HttpServletRequest request,
HttpServletResponse response, Object controller) throws
Exception {
	String uri = request.getRequestURI();
	if (uri.contains("bootstrap") 
	|| uri.contains("css") 
	|| uri.contains("img") 
	|| uri.contains("js")
	|| uri.endsWith("admin")
	|| uri.endsWith("loginCheck")
	|| uri.endsWith("loginAdminCheck")) {
	return true;
	}	
	
	if (request.getSession().getAttribute("adminLogado") != null) {	 
		uri.endsWith("admin/menu");
		uri.endsWith("categoria/add");
		return true;} response.sendRedirect("/VOX4T/admin");

		if (request.getSession().getAttribute("usuarioLogado") != null){
			uri.contains("admin"); 
			uri.endsWith("loginAdminCheck");
			return false;}
			response.sendRedirect("/VOX4T");
			return false;
	};

}


