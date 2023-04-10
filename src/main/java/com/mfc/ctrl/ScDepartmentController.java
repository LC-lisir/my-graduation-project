package com.mfc.ctrl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mfc.cons.Sys;
import com.mfc.entity.ScDepartment;
import com.mfc.entity.ScEmployees;
import com.mfc.service.ScDepartmentService;
import com.mfc.service.ScEmployeesService;
import com.sun.DateUtils;
 

@Controller
@RequestMapping("/department")
public class ScDepartmentController {

	@Autowired
	private ScDepartmentService scDepartmentService;
	@Autowired
	private ScEmployeesService scEmployeesService;

	 
	@RequestMapping("/toedit")
	public String toedit(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScDepartment o,Model model) {
		if(o.getId()!=null){
			o=scDepartmentService.getById(o.getId()+"");
			model.addAttribute("o",o);
		}
		model.addAttribute("pageNo", pageNo);
		return "department_add";
	} 
	
	@RequestMapping("/save")
	public String save(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScDepartment o,Model model) {
		if(o.getId()==null){
			o.setCts(DateUtils.DateTimeToString(new Date()));
			scDepartmentService.insert(o);
			return   "redirect:/department/page";
			
		}else{
			scDepartmentService.update(o);
			return  "redirect:/department/page?pageNo="+pageNo;
		}
		 
	}
	 

	@RequestMapping("/page")
	public String page(@RequestParam(value="pageNo",defaultValue="1")int pageNo
			,ScDepartment o,Model model) {
		PageHelper.startPage(pageNo,Sys.pageSize," id desc ");
		List<ScDepartment> li=scDepartmentService.list(o);
		PageInfo<ScDepartment> pageInfo=new PageInfo<ScDepartment>(li, Sys.pageSize);
		 
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("o", o);
		return "department_page";
	} 
	
	
	@RequestMapping("/del")
	public String del(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScDepartment o,Model model) {
		ScEmployees e=new ScEmployees();
		e.setDepartment_id(o.getId()+"");
		List<ScEmployees> li=scEmployeesService.list(e);
		if(li!=null&&li.size()>0){
			model.addAttribute("msg", "删除失败，请先删除以下员工信息");
			return  "forward:/department/page?pageNo="+pageNo;
		}
		
		scDepartmentService.delete(o.getId()+""); 
		return  "redirect:/department/page?pageNo="+pageNo;
		 
	}
	
	 
	 
	 
}
