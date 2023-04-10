package com.mfc.ctrl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mfc.cons.Sys;
import com.mfc.entity.ScApply;
import com.mfc.entity.ScDepartment;
import com.mfc.entity.ScEmployees;
import com.mfc.entity.ScSchedul;
import com.mfc.entity.ScSchedulManager;
import com.mfc.service.ScApplyService;
import com.mfc.service.ScDepartmentService;
import com.mfc.service.ScSchedulManagerService;
import com.mfc.service.ScEmployeesService;
import com.mfc.service.ScSchedulService;
import com.sun.DateUtils;


@Controller
@RequestMapping("/schedulManager")
public class ScSchedulManagerController {

	@Autowired
	private ScSchedulManagerService scSchedulManagerService;
	@Autowired
	private ScEmployeesService scEmployeesService;
	@Autowired
	private ScDepartmentService scDepartmentService;
	@Autowired
	private ScSchedulService scSchedulService;
	@Autowired
	private ScApplyService scApplyService;


	@RequestMapping("/toadd")
	public String toadd(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScSchedulManager o,Model model) {

		List<ScDepartment> deli=scDepartmentService.list(null);
		model.addAttribute("deli", deli);

		List<ScSchedul> scli=scSchedulService.list(null);
		model.addAttribute("scli", scli);

		model.addAttribute("pageNo", pageNo);
		return "schedul_manager_add";
	}

	@RequestMapping("/toedit")
	public String toedit(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScSchedulManager o,Model model) {

		o=scSchedulManagerService.getById(o.getId()+"");
		model.addAttribute("o", o);

		List<ScDepartment> deli=scDepartmentService.list(null);
		model.addAttribute("deli", deli);

		List<ScSchedul> scli=scSchedulService.list(null);
		model.addAttribute("scli", scli);

		model.addAttribute("pageNo", pageNo);
		return "schedul_manager_edit";
	}

	@RequestMapping("/save")
	public String save(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScSchedulManager o,Model model) {
		if(o.getId()==null){
			o.setCts(DateUtils.DateTimeToString(new Date()));
			if(o.getType().equals("month")){
				cont_days(o,1,null);
			}else if(o.getType().equals("days")){
				String start_day=o.getDay().split("@")[0];
				String end_day=o.getDay().split("@")[1];

				int start_month=Integer.parseInt(start_day.split("-")[1]);
				int start_day1=Integer.parseInt(start_day.split("-")[2]);
				int end_month=Integer.parseInt(end_day.split("-")[1]);
				int end_day1=Integer.parseInt(end_day.split("-")[2]);
				//同一月的几天
				if(start_month==end_month){
					o.setDay(start_day.split("-")[0]+"-"+start_day.split("-")[1]);
					cont_days(o,start_day1,end_day1);
				}else{
					o.setDay(start_day.split("-")[0]+"-"+start_day.split("-")[1]);
					cont_days(o,start_day1,null);
					o.setDay(end_day.split("-")[0]+"-"+end_day.split("-")[1]);
					cont_days(o,1,end_day1);
				}

			}else if(o.getType().equals("time")){
				scSchedulManagerService.insert(o);
			}
			return   "redirect:/schedulManager/page";

		}else{
			scSchedulManagerService.update(o);
			return  "redirect:/schedulManager/page?pageNo="+pageNo;
		}

	}
	protected void cont_days(ScSchedulManager o,Integer start,Integer days) {
		Integer year=Integer.parseInt(o.getDay().split("-")[0]);
		String month=o.getDay().split("-")[1];

		String cts=DateUtils.DateTimeToString(new Date());

		if(days==null){
			if(month.equals("02")){
				 //是润年
				 if(year%4==0&&year%100!=0){
					 days=29;
				 }else{
					 days=28;
				 }
			 }else if(month.equals("01")||month.equals("03")||month.equals("05")||month.equals("07")||month.equals("08")||month.equals("10")||month.equals("12")){
				 days=31;
			 }else{
				 days=30;
			 }
		}
		System.out.println(month+"==="+days);

		 for(int i=start;i<=days;i++){
			 ScSchedulManager scm=new ScSchedulManager();
			 if(i<10)scm.setDay(o.getDay()+"-0"+i);
			 else scm.setDay(o.getDay()+"-"+i);
			 scm.setEmployees_id(o.getEmployees_id());
			 scm.setCts(cts);
			 scm.setStart_ts(o.getStart_ts());
			 scm.setEnd_ts(o.getEnd_ts());
			 scm.setType(o.getType());
			 scm.setNote(o.getNote());
			 scSchedulManagerService.insert(scm);
		 }
	}
	protected Integer cont_days(String date) {
		Integer year=Integer.parseInt(date.split("-")[0]);
		String month=date.split("-")[1];
		 int days=1;
		if(month.equals("02")){
			 //是润年
			 if(year%4==0&&year%100!=0){
				 days=29;
			 }else{
				 days=28;
			 }
		 }else if(month.equals("01")||month.equals("03")||month.equals("05")||month.equals("07")||month.equals("08")||month.equals("10")||month.equals("12")){
			 days=31;
		 }else{
			 days=30;
		 }
		 return days;

	}
	@RequestMapping("/page")
	public String page(@RequestParam(value="pageNo",defaultValue="1")int pageNo
			,ScSchedulManager o,Model model) {
		PageHelper.startPage(pageNo,Sys.pageSize," id desc ");
		List<ScSchedulManager> li=scSchedulManagerService.list(o);
		PageInfo<ScSchedulManager> pageInfo=new PageInfo<ScSchedulManager>(li, Sys.pageSize);

		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("o", o);

		List<ScDepartment> deli=scDepartmentService.list(null);
		model.addAttribute("deli", deli);

		return "schedul_manager_page";
	}

	@RequestMapping("/mypage")
	public String mypage(@RequestParam(value="pageNo",defaultValue="1")int pageNo
			,ScSchedulManager o,Model model,HttpSession session) {
		if(o.getEmployees_id()!=null&&o.getEmployees_id().trim().length()>0){
			ScEmployees emp=scEmployeesService.getById(o.getEmployees_id());
			model.addAttribute("emp", emp);
		}else{
			ScEmployees e= (ScEmployees) session.getAttribute("loginU");
			o.setEmployees_id(e.getId()+"");

		}

		String cts=DateUtils. DateToString(new Date(), "yyyy-MM");
		if(o.getStart_ts1()==null||o.getStart_ts1().isEmpty()){
			o.setStart_ts1(cts+"-"+"01");
		}
		if(o.getEnd_ts1()==null||o.getEnd_ts1().isEmpty()){
			o.setEnd_ts1(cts+"-"+cont_days(cts));
		}
		PageHelper.startPage(pageNo,Sys.pageSize," day asc ");
		List<ScSchedulManager> li=scSchedulManagerService.list(o);
		PageInfo<ScSchedulManager> pageInfo=new PageInfo<ScSchedulManager>(li, Sys.pageSize);

		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("o", o);

		List<ScDepartment> deli=scDepartmentService.list(null);
		model.addAttribute("deli", deli);

		return "my_schedul_manager_page";
	}


	@RequestMapping("/mycal")
	public String mycal(ScSchedulManager o,Model model,HttpSession session) throws Exception {
		if(o.getEmployees_id()!=null&&o.getEmployees_id().trim().length()>0){
			ScEmployees emp=scEmployeesService.getById(o.getEmployees_id());
			model.addAttribute("emp", emp);
		}else{
			ScEmployees e= (ScEmployees) session.getAttribute("loginU");
			o.setEmployees_id(e.getId()+"");

		}

		String cts=DateUtils. DateToString(new Date(), "yyyy-MM");
		int days=DateUtils.getDaysOfMonth(new Date());
		if(o.getDay()==null||o.getDay().isEmpty()){
			o.setDay(cts);

		} else{
			cts=o.getDay();
			Date d=DateUtils.StringToMonth(o.getDay());
			days=DateUtils.getDaysOfMonth(d);
		}


		List<ScSchedulManager> li=scSchedulManagerService.list(o);
		Map<String,ScSchedulManager> sm= new HashMap<String,ScSchedulManager>();
		if(li!=null&&li.size()>0){
			for(ScSchedulManager ss:li){
				sm.put(ss.getDay(), ss);
			}
		}

		List ali=new ArrayList();
		for(int i=1;i<=days;i++){
			Map m=new HashMap();
			String c=cts+"-"+i;
			if(i<10)c=cts+"-0"+i;
			String w = DateUtils.getWeekOfDate(DateUtils.StringToDate(c));
			m.put("note", "no");


			ScSchedulManager ss= sm.get(c);

			if(ss!=null){
				if(ss.getNote()!=null&&ss.getNote().trim().length()>0)m.put("note", ss.getNote());
				m.put("has", 1);
				m.put("obj", ss);
				m.put("id", ss.getId());
			}else{
				m.put("has", 0);
				m.put("note", "no");
			}
			m.put("week", w);
			m.put("day", c.split("-")[2]);
			if(i==1){
				if(w.equals("7"))model.addAttribute("w", 0);
				else model.addAttribute("w", w);
			}
			ali.add(m);
		}

		model.addAttribute("ali", ali);
		model.addAttribute("o", o);


		return "my_schedul_manager_cal";
	}


	@RequestMapping("/del")
	public String del(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScSchedulManager o,Model model) {
		String day=o.getDay();
		o=scSchedulManagerService.getById(o.getId()+"");
		scSchedulManagerService.delete(o.getId()+"");
		return  "redirect:/schedulManager/mycal?employees_id="+o.getEmployees_id()+"&day="+day;

	}

	 @ResponseBody
	@RequestMapping("/canSchedul")
	public Object canSchedul(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScSchedulManager o,Model model) {
		 Map<String,Object> m=new HashMap<String,Object>();

//		 ScSchedulManager con=new ScSchedulManager();
//		 con.setDay(o.getDay());
//		 con.setEmployees_id(o.getEmployees_id());
		 List<ScSchedulManager> li=scSchedulManagerService.list(o) ;
		 String msg="";
		 if(li!=null&&li.size()>0){
			 for(ScSchedulManager ol:li){
				 msg+= "该用户已被排班，排班时间："+ol.getDay()+"  "+ol.getStart_ts()+"-"+ol.getEnd_ts()+"<br>";
			 }
			 if(msg.trim().length()>0){
//				 if(o.getDay()){
				 m.put("status", "0");
				 m.put("msg",msg);
				 return m;//}
			 }
		 }

		 String msg1="";
		 ScApply a=new ScApply();
		 a.setEmployees_id(o.getEmployees_id());
		 List<ScApply> ali=scApplyService.list(a);
		 if(ali!=null&&ali.size()>0){
			 for(ScApply app:ali){
				 if(!app.getIs_audit().equals("2")){
					 if(app.getStart_ts().indexOf(o.getDay())>-1||app.getEnd_ts().indexOf(o.getDay())>-1){
						 String s="";
						 if(app.getIs_audit().equals("0"))s="待管理员审核";
						 if(app.getIs_audit().equals("1"))s="管理员已批准";
						 msg1+="该用户已请假（"+s+"），请假时间："+app.getStart_ts().replace("T", " ")+" 到  "+app.getEnd_ts().replace("T", " ")+"<br>";

					 }

				}
			 }
			 if(msg1.trim().length()>0){
				 m.put("status", "0");
				 m.put("msg",msg1 );
				 return m;
			 }


		 }
		 m.put("status", "1");
		 m.put("msg", "可排班");

		return m;

	}

}
