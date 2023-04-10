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
import com.mfc.entity.ScNotice;
import com.mfc.service.ScNoticeService;
import com.sun.DateUtils;
 

@Controller
@RequestMapping("/notice")
public class ScNoticeController {

	@Autowired
	private ScNoticeService ScNoticeService;

	 
	@RequestMapping("/toedit")
	public String toedit(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScNotice o,Model model) {
		if(o.getId()!=null){
			o=ScNoticeService.getById(o.getId()+"");
			model.addAttribute("o",o);
		}
		model.addAttribute("pageNo", pageNo);
		return "notice_add";
	} 
	
	@RequestMapping("/save")
	public String save(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScNotice o,Model model) {
		if(o.getId()==null){
			o.setCts(DateUtils.DateTimeToString(new Date()));
			ScNoticeService.insert(o);
			return   "redirect:/notice/page";
			
		}else{
			ScNoticeService.update(o);
			return  "redirect:/notice/page?pageNo="+pageNo;
		}
		 
	}
	 

	@RequestMapping("/page")
	public String page(@RequestParam(value="pageNo",defaultValue="1")int pageNo
			,ScNotice o,Model model) {
		PageHelper.startPage(pageNo,Sys.pageSize," cts desc ");
		List<ScNotice> li=ScNoticeService.list(o);
		PageInfo<ScNotice> pageInfo=new PageInfo<ScNotice>(li, Sys.pageSize);
		 
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("o", o);
		return "notice_page";
	} 
	
	
	@RequestMapping("/del")
	public String del(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScNotice o,Model model) {
		ScNoticeService.delete(o.getId()+""); 
		return  "redirect:/notice/page?pageNo="+pageNo;
		 
	}
	
	 
	@RequestMapping("/employees_page")
	public String employees_page(@RequestParam(value="pageNo",defaultValue="1")int pageNo
			,ScNotice o,Model model) {
		PageHelper.startPage(pageNo,Sys.pageSize," cts desc ");
		List<ScNotice> li=ScNoticeService.list(o);
		PageInfo<ScNotice> pageInfo=new PageInfo<ScNotice>(li, Sys.pageSize);
		 
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("o", o);
		return "notice_employees_page";
	} 
	 
}
