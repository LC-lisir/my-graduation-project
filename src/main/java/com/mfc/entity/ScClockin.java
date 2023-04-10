package com.mfc.entity;

public class ScClockin {
	private Integer id;
	private String employees_id; 
	private String day; 
	private String cts;
	private String dkstart_ts;
	private String dkend_ts;
	private String is_late;//跟排班时间对比1正常-1迟到0未排班无法判断是否迟到
	private String leave_early;//跟排班时间对比1正常-1早退0未排班无法判断是否早退
 
	
	/*----*/
	private String start_ts;
	private String end_ts;
	private String realname;
	private String dname;
	private String uno;
	private String department_id;
	
	private Integer num;
	
	
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getIs_late() {
		return is_late;
	}
	public void setIs_late(String is_late) {
		this.is_late = is_late;
	}
	public String getLeave_early() {
		return leave_early;
	}
	public void setLeave_early(String leave_early) {
		this.leave_early = leave_early;
	}
	public String getDkstart_ts() {
		return dkstart_ts;
	}
	public void setDkstart_ts(String dkstart_ts) {
		this.dkstart_ts = dkstart_ts;
	}
	public String getDkend_ts() {
		return dkend_ts;
	}
	public void setDkend_ts(String dkend_ts) {
		this.dkend_ts = dkend_ts;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEmployees_id() {
		return employees_id;
	}
	public void setEmployees_id(String employees_id) {
		this.employees_id = employees_id;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getCts() {
		return cts;
	}
	public void setCts(String cts) {
		this.cts = cts;
	}
	public String getStart_ts() {
		return start_ts;
	}
	public void setStart_ts(String start_ts) {
		this.start_ts = start_ts;
	}
	public String getEnd_ts() {
		return end_ts;
	}
	public void setEnd_ts(String end_ts) {
		this.end_ts = end_ts;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getUno() {
		return uno;
	}
	public void setUno(String uno) {
		this.uno = uno;
	}
	public String getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(String department_id) {
		this.department_id = department_id;
	}
	 
	 
	 
	
}
