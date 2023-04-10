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
import com.mfc.entity.ScSchedul;
import com.mfc.service.ScSchedulService;
import com.sun.DateUtils;
 

@Controller
@RequestMapping("/schedul")
public class  ScSchedulController {

	@Autowired
	private ScSchedulService scSchedulService;

	 
	@RequestMapping("/toedit")
	public String toedit(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScSchedul o,Model model) {
		if(o.getId()!=null){
			o=scSchedulService.getById(o.getId()+"");
			model.addAttribute("o",o);
		}
		model.addAttribute("pageNo", pageNo);
		return "schedul_add";
	} 
	
	@RequestMapping("/save")
	public String save(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScSchedul o,Model model) {
		if(o.getId()==null){
			o.setCts(DateUtils.DateTimeToString(new Date()));
			scSchedulService.insert(o);
			return   "redirect:/schedul/page";
			
		}else{
			scSchedulService.update(o);
			return  "redirect:/schedul/page?pageNo="+pageNo;
		}
		 
	}
	 

	@RequestMapping("/page")
	public String page(@RequestParam(value="pageNo",defaultValue="1")int pageNo
			,ScSchedul o,Model model) {
		PageHelper.startPage(pageNo,Sys.pageSize," id desc ");
		List<ScSchedul> li=scSchedulService.list(o);
		PageInfo<ScSchedul> pageInfo=new PageInfo<ScSchedul>(li, Sys.pageSize);
		 
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("o", o);
		return "schedul_page";
	} 
	
	
	@RequestMapping("/del")
	public String del(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScSchedul o,Model model) {
		scSchedulService.delete(o.getId()+""); 
		return  "redirect:/schedul/page?pageNo="+pageNo;
		 
	}
	
	 
	 
	 
}
