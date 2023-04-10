package com.mfc.service;

import java.util.List;

import com.mfc.entity.ScClockin;

 


 

 

public interface  ScClockinService {
	 
		
	 public void insert(ScClockin o); 
	 
	 public void update(ScClockin o);
	 public ScClockin getById(String  id);   
	 public List<ScClockin> list(ScClockin o);
	 public void delete(String id);
	  public List<ScClockin> getLateNumByDepartment(ScClockin o);
	   public List<ScClockin> getLeaveNumByDepartment(ScClockin o);
	   public  Integer getCount(ScClockin o);
}
