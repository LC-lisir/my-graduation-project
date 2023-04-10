package com.mfc.service;

import java.util.List;

import com.mfc.entity.ScSchedulManager;

 


 

 

public interface   ScSchedulManagerService {
	 
		
	 public void insert(ScSchedulManager o); 
	 
	 public void update(ScSchedulManager o);
	 public ScSchedulManager getById(String  id);   
	 public List<ScSchedulManager> list(ScSchedulManager o);
	 public void delete(String id);
}
