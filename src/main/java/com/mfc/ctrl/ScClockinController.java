package com.mfc.ctrl;

import java.util.ArrayList;
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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mfc.cons.Sys;
import com.mfc.entity.ScClockin;
import com.mfc.entity.ScDepartment;
import com.mfc.entity.ScEmployees;
import com.mfc.entity.ScSchedulManager;
import com.mfc.service.ScClockinService;
import com.mfc.service.ScDepartmentService;
import com.mfc.service.ScEmployeesService;
import com.mfc.service.ScSchedulManagerService;
import com.sun.DateUtils;
 
 

@Controller
@RequestMapping("/clockin")
public class ScClockinController {
	@Autowired
	private ScSchedulManagerService scSchedulManagerService;
	@Autowired
	private ScClockinService scClockinService;
	@Autowired
	private ScEmployeesService scEmployeesService;

	@Autowired
	private ScDepartmentService scDepartmentService;

	
	@RequestMapping("/toadd")
	public String toadd(Model model) {
			return   "clock_in";
	} 
	
	
	 
	
	 @ResponseBody
	@RequestMapping("/add")
	public Object add(@RequestParam(value="pageNo",defaultValue="1")int pageNo,ScClockin o,Model model,HttpSession session,String faceimg,
			HttpServletRequest request) throws Exception {
		String day=DateUtils.DateToString(new Date(), "yyyy-MM-dd");
		ScEmployees e= (ScEmployees) session.getAttribute("loginU");
		e=scEmployeesService.getById(e.getId()+"");
		
		Map<String,Object> m=new HashMap<String,Object>();
		 
		ScClockin con=new ScClockin();
		con.setDay(day);
		con.setEmployees_id(e.getId()+"");
		List<ScClockin> li=scClockinService.list(con);
		
		int isend=0;
		if(li!=null&&li.size()>0){
			con=li.get(li.size()-1);
			long oldt=DateUtils.dateToStamp(con.getCts());
			long nowt=DateUtils.dateToStamp(DateUtils.DateTimeToString(new Date()));
			System.out.println(oldt+" ==  "+nowt);
			System.out.println(nowt-oldt);
			if(nowt-oldt<(Sys.clockin_hour*3600*1000)){
				m.put("status", "-2");
				m.put("msg", "已打卡请勿重复操作，"+Sys.clockin_hour+"小时后可以打卡");
				return m ;
			} else{
				if(con.getDkend_ts()!=null&&!con.getDkend_ts().isEmpty()){
					m.put("status", "-2");
					m.put("msg", "今天的打卡已经结束，请勿重复操作");
					return m ;
				}else{
					isend=1;
				}
			}
			
		
		}  
			 
		ScSchedulManager pb=new ScSchedulManager();
		pb.setDay(day);
		pb.setEmployees_id(e.getId()+"");
		List<ScSchedulManager> pbli=scSchedulManagerService.list(pb);
		ScSchedulManager s=null;
		if(pbli!=null&&pbli.size()>0){
			s=pbli.get(0);
		}
		String hm=DateUtils.DateToString(new Date(), "HH:mm");
		
		if(isend==0){
			
			ScClockin c=new ScClockin();
			c.setEmployees_id(e.getId()+"");
		    c.setCts(DateUtils.DateTimeToString(new Date()));
			c.setDay(day);
			c.setDkstart_ts(hm);
			if(s!=null){
				if(hm.compareTo(s.getStart_ts())>0){
					c.setIs_late("-1");
					scClockinService.insert(c);
					
					m.put("status", "11");
					m.put("msg", "打卡成功,已迟到");
					m.put("obj",c);
					return   m;  
				}else{
					c.setIs_late("1");
					scClockinService.insert(c);
					
					m.put("status", "1");
					m.put("msg", "打卡成功");
					m.put("obj",c);
					return   m;  
				}
			}else{
				c.setIs_late("0");
				scClockinService.insert(c);
			}

			
			m.put("status", "1");
			m.put("msg", "打卡成功");
			m.put("obj",c);
			return   m;  
		}else{
			con.setDkend_ts(hm);
			if(s!=null){
				if(hm.compareTo(s.getEnd_ts())<0){
					con.setLeave_early("-1");
					scClockinService.update(con);
					
					m.put("status", "12");
					m.put("msg", "打卡成功，已早退");
					m.put("obj",con);
					return   m;  
				}else{
					con.setLeave_early("1");
					scClockinService.update(con);
					
					m.put("status", "1");
					m.put("msg", "打卡成功");
					m.put("obj",con);
					return   m;  
				}
			}else{
				con.setLeave_early("0");
				scClockinService.update(con);
			}
			

			m.put("status", "1");
			m.put("msg", "打卡成功");
			m.put("obj",con);
			return   m;   
			
		}
			
	}  
	 
	 

	@RequestMapping("/page")
	public String page(@RequestParam(value="pageNo",defaultValue="1")int pageNo
			,ScClockin o,Model model) {
		PageHelper.startPage(pageNo,Sys.pageSize," cts asc ");
		List<ScClockin> li=scClockinService.list(o);
		PageInfo<ScClockin> pageInfo=new PageInfo<ScClockin>(li, Sys.pageSize);
		 
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("o", o);
		

		List<ScDepartment> deli=scDepartmentService.list(null);
		model.addAttribute("deli", deli);
		return "clockin_page";
	} 
	
	
	@RequestMapping("/mypage")
	public String mypage(@RequestParam(value="pageNo",defaultValue="1")int pageNo
			,ScClockin o,Model model,HttpSession session) {
		if(o.getEmployees_id()!=null&&o.getEmployees_id().trim().length()>0){
			ScEmployees emp=scEmployeesService.getById(o.getEmployees_id());
			model.addAttribute("emp", emp);
		}else{
			ScEmployees e= (ScEmployees) session.getAttribute("loginU");
			o.setEmployees_id(e.getId()+""); 
			
		}
		
		PageHelper.startPage(pageNo,Sys.pageSize," id desc ");
		List<ScClockin> li=scClockinService.list(o);
		PageInfo<ScClockin> pageInfo=new PageInfo<ScClockin>(li, Sys.pageSize);
		 
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("o", o);
		return "my_clockin_page";
	}  
	
	
	@RequestMapping("/mycal")
	public String mypage(ScClockin o,Model model,HttpSession session) throws Exception {
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
		 
		
		ScSchedulManager smager=new ScSchedulManager();
		smager.setEmployees_id(o.getEmployees_id());
		smager.setDay(o.getDay());
		List<ScSchedulManager> smagerli=scSchedulManagerService.list(smager);
		Map<String,ScSchedulManager> smagerMap=new HashMap<String,ScSchedulManager>();
		for(ScSchedulManager m:smagerli){
			smagerMap.put(m.getDay(), m);
		}
		
		
		ScClockin cc=new ScClockin();
		cc.setEmployees_id(o.getEmployees_id());
		cc.setDay(o.getDay());
		cc.setIs_late("-1");
		Integer lateNum=scClockinService.getCount(cc);
		model.addAttribute("lateNum", lateNum);
		
		cc=new ScClockin();
		cc.setEmployees_id(o.getEmployees_id());
		cc.setDay(o.getDay());
		cc.setLeave_early("-1");
		Integer leaveNum=scClockinService.getCount(cc);
		model.addAttribute("leaveNum", leaveNum);
		
		
		Map<String,Map<String,String>> sm=new HashMap<String,Map<String,String>>();
		List<ScClockin> li=scClockinService.list(o);
		for(ScClockin s:li){
			Map<String,String> tsmap=new HashMap<String,String>();
			tsmap.put("dkstart_ts", s.getDkstart_ts());
			tsmap.put("dkend_ts", s.getDkend_ts());
			tsmap.put("day", s.getDay());
			tsmap.put("is_late", s.getIs_late());
			tsmap.put("leave_early", s.getLeave_early());
			
			
			sm.put(s.getDay(), tsmap);
			 
		}
		 
		List ali=new ArrayList();
		for(int i=1;i<=days;i++){
			Map m=new HashMap();
			String c=cts+"-"+i;
			if(i<10)c=cts+"-0"+i;
			String w = DateUtils.getWeekOfDate(DateUtils.StringToDate(c));
			 
			Map<String,String> tsmap= sm.get(c);
			
			if(tsmap!=null&&!tsmap.isEmpty()){
				m.put("has", 1);
				m.put("dkstart_ts", tsmap.get("dkstart_ts"));
				m.put("dkend_ts", tsmap.get("dkend_ts"));
				m.put("is_late",  tsmap.get("is_late"));
				m.put("leave_early",tsmap.get("leave_early"));
				
			}else{
				 
				m.put("has", 0);
			}
			
			
			ScSchedulManager smm=smagerMap.get(c);
			if(smm!=null){
				m.put("schedulManager", "1");
				m.put("schedulManager_start_ts", smm.getStart_ts());
				m.put("schedulManager_end_ts", smm.getEnd_ts());
			}else{
				m.put("schedulManager", "0");
			} 
			m.put("week", w);
			m.put("day", c.split("-")[2]);
			if(i==1){
				if(w.equals("7"))model.addAttribute("w", 0);
				else model.addAttribute("w", w);
			}
			ali.add(m);
		}
		
		 
		model.addAttribute("ali",ali);
		model.addAttribute("o", o);
		return "my_clockin_cal";
	}  
	
	 
	@RequestMapping("/tj")
	public String tj(@RequestParam(value="pageNo",defaultValue="1")int pageNo
			,ScClockin o,Model model,HttpSession session ) {
		 
		List<ScDepartment> li=scDepartmentService.list(null);
		model.addAttribute("deli",li);
		return "clock_in_tj";
	} 
	
	@ResponseBody
	@RequestMapping("/gettj")
	public Object gettj(@RequestParam(value="pageNo",defaultValue="1")int pageNo
			,ScClockin o,Model model,HttpSession session,String type ) {
		 
		List<ScClockin> li=null;
	 
			if(type.equals("late")){
				o.setIs_late("-1");
				li=scClockinService.getLateNumByDepartment(o);
				 
			}else if(type.equals("leave")){
				o.setLeave_early("-1");
				li=scClockinService.getLeaveNumByDepartment(o);
				 
			}
			
			 
		 
		return li;
	} 
	 
}
