package com.mfc.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mfc.entity.ScAdmin;
import com.mfc.service.ScAdminService;

@Controller
@RequestMapping("/admin")
public class ScAdminController {

	@Autowired
	private ScAdminService scAdminService;
	@RequestMapping("/to_updatePwd")
	public String to_updatePwd(ScAdmin a,HttpServletRequest req,HttpSession session,Model model) {
		  return "update_admin_pwd";
	}
	@RequestMapping("/updatePwd")
	public String updatePwd(ScAdmin a,HttpServletRequest req,HttpSession session,Model model) {
		 String old_upass=req.getParameter("old_upass") ;
		 String new_upass=req.getParameter("new_upass") ;
		 String new_upass2=req.getParameter("new_upass2") ;

		 a=(ScAdmin) session.getAttribute("loginU");
		 a=scAdminService.getById(a.getId()+"");
		 if(!a.getUpass().equals(old_upass)){
			 model.addAttribute("msg", "原密码不对,修改密码失败");
			 return "update_admin_pwd";
		 }
		 if(!new_upass.equals(new_upass2)){
			 model.addAttribute("msg", "两次密码输入不一致,修改密码失败");
			 return "update_admin_pwd";
		 }
		 a.setUpass(new_upass);
		 scAdminService.update(a);
		 model.addAttribute("msg", "密码修改成功");

		 return "update_admin_pwd";

	}
}
