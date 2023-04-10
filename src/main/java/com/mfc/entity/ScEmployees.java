package com.mfc.entity;

public class  ScEmployees {
	private Integer id;
	private String uno; 
	private String upass; 
	private String sex; 
	private String borth; 
	private String department_id; 
	private String realname; 
	private String cts;
	private String faceimg;
	/*----*/
	private String dname;
	private String sertype;//用于查询，打卡，排班，用户管理区分
	
	
	
	 
	public String getFaceimg() {
		return faceimg;
	}
	public void setFaceimg(String faceimg) {
		this.faceimg = faceimg;
	}
	public String getSertype() {
		return sertype;
	}
	public void setSertype(String sertype) {
		this.sertype = sertype;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUno() {
		return uno;
	}
	public void setUno(String uno) {
		this.uno = uno;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBorth() {
		return borth;
	}
	public void setBorth(String borth) {
		this.borth = borth;
	}
	public String getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(String department_id) {
		this.department_id = department_id;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getCts() {
		return cts;
	}
	public void setCts(String cts) {
		this.cts = cts;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	 
	 
	 
	
}
