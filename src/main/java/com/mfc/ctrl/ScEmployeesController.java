package com.mfc.ctrl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mfc.cons.Sys;
import com.mfc.entity.ScDepartment;
import com.mfc.entity.ScEmployees;
import com.mfc.service.ScDepartmentService;
import com.mfc.service.ScEmployeesService;
import com.sun.DateUtils;
import com.mfc.untils.UploadFile;
 

@Controller
@RequestMapping("/employees")
public class  ScEmployeesController {

	@Autowired
	private ScEmployeesService scEmployeesService;
	@Autowired
	private ScDepartmentService scDepartmentService;

	@ResponseBody
	@RequestMapping("/check_uno")
	public Object check_uno(ScEmployees o,Model model) {
		Map<String,Object> m=new HashMap<String,Object>(); 
		List<ScEmployees> li=scEmployeesService.list(o);
		if(li!=null&&li.size()>0){
			m.put("status", "0");
			m.put("msg", "该编号已被使用，请换一个");
		}else{
			m.put("status", "1");
			m.put("msg", "该编号可用");
		}
		return m;
	} 
	 
	@RequestMapping("/toedit")
	public String toedit(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScEmployees o,Model model) {
		String sertype=o.getSertype();
	 
		if(o.getId()!=null){
			o=scEmployeesService.getById(o.getId()+"");
			
		}
		o.setSertype(sertype);
		model.addAttribute("o",o);
		model.addAttribute("pageNo", pageNo);
		
		List<ScDepartment> deli=scDepartmentService.list(null);
		model.addAttribute("deli", deli);
		return "employees_add";
	} 
	
	@RequestMapping("/save")
	public String save(@RequestParam("file") MultipartFile file,@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScEmployees o,Model model,HttpServletRequest request) {
		String sertype=o.getSertype();
		if(o.getId()==null){
			ScEmployees ocon=new ScEmployees();
			ocon.setUno(o.getUno());
			List<ScEmployees> li=scEmployeesService.list(ocon);
			if(li!=null&&li.size()>0){
				model.addAttribute("msg", "该编号已被使用，请换一个");
				return   "forward:/employees/toedit";
			}
			o.setFaceimg(UploadFile.upimg(file, request, Sys.Upimg.photo));
			o.setCts(DateUtils.DateTimeToString(new Date()));
			o.setUpass(Sys.default_pwd);
			scEmployeesService.insert(o);
			return  "redirect:/employees/page?sertype="+sertype;
			
		}else{
			if(file.getSize()>0){
				ScEmployees ol=scEmployeesService.getById(o.getId()+"");
				UploadFile.deleteFile(request, ol.getFaceimg());
				o.setFaceimg(UploadFile.upimg(file, request, Sys.Upimg.photo));
			}
			
			scEmployeesService.update(o);
			return  "redirect:/employees/page?pageNo="+pageNo+"&sertype="+sertype;
		}
		 
	}
	 

	@RequestMapping("/page")
	public String page(@RequestParam(value="pageNo",defaultValue="1")int pageNo
			,ScEmployees o,Model model) {
		 
		PageHelper.startPage(pageNo,Sys.pageSize," id desc ");
		List<ScEmployees> li=scEmployeesService.list(o);
		PageInfo<ScEmployees> pageInfo=new PageInfo<ScEmployees>(li, Sys.pageSize);
		 
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("o", o);
		
		List<ScDepartment> deli=scDepartmentService.list(null);
		model.addAttribute("deli", deli);
		return "employees_page";
	} 
	
	@ResponseBody
	@RequestMapping("/page_ajax")
	public Object page_ajax(@RequestParam(value="pageNo",defaultValue="1")int pageNo
			,ScEmployees o) {
		PageHelper.startPage(pageNo,Sys.pageSize," id desc ");
		List<ScEmployees> li=scEmployeesService.list(o);
		PageInfo<ScEmployees> pageInfo=new PageInfo<ScEmployees>(li, Sys.pageSize);
		return pageInfo;
	} 
	
	@RequestMapping("/del")
	public String del(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScEmployees o,Model model,HttpServletRequest request) {
		String sertype=o.getSertype();
		o=scEmployeesService.getById(o.getId()+"");
		if(o.getFaceimg()!=null&&o.getFaceimg().trim().length()>0){
			ScEmployees ol=scEmployeesService.getById(o.getId()+"");
			UploadFile.deleteFile(request, ol.getFaceimg());
		}
		scEmployeesService.delete(o.getId()+""); 
		return  "redirect:/employees/page?pageNo="+pageNo+"&sertype="+sertype;
		 
	}
	
	 
	@RequestMapping("/initPwd")
	public String initPwd(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScEmployees o,Model model) {
		o.setUpass(Sys.default_pwd);
		scEmployeesService.update(o);
		model.addAttribute("msg","初始密码123456");
		return  "forward:/employees/page?pageNo="+pageNo;
		 
	} 
	
	

	@RequestMapping("/to_updatePwd")
	public String to_updatePwd() {
		  return "update_employees_pwd";
	}
	@RequestMapping("/updatePwd")
	public String updatePwd(ScEmployees o,HttpServletRequest req,HttpSession session,Model model) {
		 String old_upass=req.getParameter("old_upass") ;
		 String new_upass=req.getParameter("new_upass") ;
		 String new_upass2=req.getParameter("new_upass2") ;
		 
		 o=(ScEmployees) session.getAttribute("loginU");
		 o=scEmployeesService.getById(o.getId()+"");
		 if(!o.getUpass().equals(old_upass)){
			 model.addAttribute("msg", "原密码不对,修改密码失败");
			 return "update_admin_pwd";
		 }
		 if(!new_upass.equals(new_upass2)){
			 model.addAttribute("msg", "两次密码输入不一致,修改密码失败");
			 return "update_admin_pwd";
		 }
		 o.setUpass(new_upass);
		 scEmployeesService.update(o);
		 model.addAttribute("msg", "密码修改成功");
		 
		 return "update_employees_pwd";
		
	}
	 
	
	@RequestMapping("/info")
	public String employees_info(HttpSession session,Model model) {
		ScEmployees o=(ScEmployees) session.getAttribute("loginU");
		o=scEmployeesService.getById(o.getId()+"");
		model.addAttribute("o", o);
		  return "employees_info";
	}
}
