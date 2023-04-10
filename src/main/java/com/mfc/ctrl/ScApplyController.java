package com.mfc.ctrl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mfc.cons.Sys;
import com.mfc.entity.ScApply;
import com.mfc.entity.ScDepartment;
import com.mfc.entity.ScEmployees;
import com.mfc.service.ScApplyService;
import com.mfc.service.ScDepartmentService;
import com.mfc.service.ScEmployeesService;
import com.sun.DateUtils;
 

@Controller
@RequestMapping("/apply")
public class  ScApplyController {
	
	@Autowired
	private ScDepartmentService scDepartmentService;

	@Autowired
	private ScApplyService scApplyService;
	@Autowired
	private ScEmployeesService scEmployeesService;

	 
	@RequestMapping("/toedit")
	public String toedit(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScApply o,Model model) {
		if(o.getId()!=null){
			o=scApplyService.getById(o.getId()+"");
			model.addAttribute("o",o);
		}
		model.addAttribute("pageNo", pageNo);
		return "apply_add";
	} 
	
	@RequestMapping("/save")
	public String save(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScApply o,Model model,HttpSession session) {
		if(o.getId()==null){
			ScEmployees e=(ScEmployees) session.getAttribute("loginU");
			o.setEmployees_id(e.getId()+"");
			o.setCts(DateUtils.DateTimeToString(new Date()));
			o.setIs_audit("0");
			 
			scApplyService.insert(o);
			return   "redirect:/apply/mypage";
			
		}else{
			 
			scApplyService.update(o);
			return  "redirect:/apply/mypage?pageNo="+pageNo;
		}
		 
	}
	@RequestMapping("/mypage")
	public String mypage(@RequestParam(value="pageNo",defaultValue="1")int pageNo
			,ScApply o,Model model,HttpSession session) {
		ScEmployees e=(ScEmployees) session.getAttribute("loginU");
		o.setEmployees_id(e.getId()+"");
		
		PageHelper.startPage(pageNo,Sys.pageSize," id desc ");
		List<ScApply> li=scApplyService.list(o);
		PageInfo<ScApply> pageInfo=new PageInfo<ScApply>(li, Sys.pageSize);
		li=pageInfo.getList();
		for(ScApply a:li){
			a.setStart_ts(a.getStart_ts().replace("T", " "));
			a.setEnd_ts(a.getEnd_ts().replace("T", " "));
		}
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("o", o);

		List<ScDepartment> deli=scDepartmentService.list(null);
		model.addAttribute("deli", deli);
		return "my_apply_page";
	}  

	@RequestMapping("/page")
	public String page(@RequestParam(value="pageNo",defaultValue="1")int pageNo
			,ScApply o,Model model) {
		PageHelper.startPage(pageNo,Sys.pageSize," cts asc ");
		List<ScApply> li=scApplyService.list(o);
		PageInfo<ScApply> pageInfo=new PageInfo<ScApply>(li, Sys.pageSize);
		for(ScApply a:li){
			a.setStart_ts(a.getStart_ts().replace("T", " "));
			a.setEnd_ts(a.getEnd_ts().replace("T", " "));
		} 
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("o", o);

		List<ScDepartment> deli=scDepartmentService.list(null);
		model.addAttribute("deli", deli);
		return "apply_page";
	} 
	
	
	@RequestMapping("/del")
	public String del(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScApply o,Model model) {
		 
		scApplyService.delete(o.getId()+""); 
		return  "redirect:/apply/mypage?pageNo="+pageNo;
		 
	}
	
	@RequestMapping("/pass")
	public String pass(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScApply o,Model model) {
		o.setIs_audit("1");
		o.setAudit_ts(DateUtils.DateTimeToString(new Date()));
		scApplyService.update(o); 
		return  "redirect:/apply/page?pageNo="+pageNo;
		 
	}
	
	@RequestMapping("/notpass")
	public String notpass(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScApply o,Model model) {
		o.setIs_audit("2");
		o.setAudit_ts(DateUtils.DateTimeToString(new Date()));
		scApplyService.update(o); 
		return  "redirect:/apply/page?pageNo="+pageNo;
		 
	}
	
	 
	 
	 
}
