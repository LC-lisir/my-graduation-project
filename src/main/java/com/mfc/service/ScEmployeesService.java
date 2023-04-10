package com.mfc.service;

import java.util.List;

import com.mfc.entity.ScEmployees;

 


 

 

public interface  ScEmployeesService {
	 
		
	 public void insert(ScEmployees o); 
	 
	 public void update(ScEmployees o);
	 public ScEmployees getById(String  id);   
	 public List<ScEmployees> list(ScEmployees o);
	 public void delete(String id);
}
