package com.mfc.ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mfc.entity.ScAdmin;
import com.mfc.entity.ScEmployees;
import com.mfc.service.ScAdminService;
import com.mfc.service.ScEmployeesService;

@Controller
public class ScLoginController {

	@Autowired
	private ScAdminService scAdminService;
	@Autowired
	private ScEmployeesService scEmployeesService;
	 

	@RequestMapping("/tologin")
	public String tologn() {
		return "login";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest req,HttpSession session,Model model) {
		String role=req.getParameter("role");
		String uname=req.getParameter("uname");
		String upass=req.getParameter("upass");
		 
		if(role.equals("admin")){
			ScAdmin a=new ScAdmin();
			a.setUname(uname);
			a.setUpass(upass);
			ScAdmin loginU=scAdminService.login(a);
			if(loginU==null){
				model.addAttribute("msg", "账号或者密码错误");
				return "login";
			}else{
				session.setAttribute("loginU", loginU);
				session.setAttribute("role", req.getParameter("role"));
				
				return "index";
			}
		}else if(role.equals("employees")){
			ScEmployees e=new ScEmployees();
			e.setUno(uname);
			e.setUpass(upass);
			List<ScEmployees> li=scEmployeesService.list(e);
			if(li!=null&&li.size()>0){
				session.setAttribute("loginU", li.get(0));
				session.setAttribute("role", req.getParameter("role"));
				
				return "index";
			}else{
				model.addAttribute("msg", "账号或者密码错误");
				return "login";
			}
		}
		return "login";
		
	}
	 
	
	@RequestMapping("/logout")
	public String logout(ScAdmin a,HttpSession session,Model model) {
		 
			session.removeAttribute("loginU"); 
			session.removeAttribute("role"); 
			return "login";
		 
		
	}
	 
}
