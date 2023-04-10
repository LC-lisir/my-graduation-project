package com.mfc.service;

import java.util.List;

import com.mfc.entity.ScDepartment;

 


 

 

public interface  ScDepartmentService {
	 
		
	 public void insert(ScDepartment o); 
	 
	 public void update(ScDepartment o);
	 public ScDepartment getById(String  id);   
	 public List<ScDepartment> list(ScDepartment o);
	 public void delete(String id);
}
