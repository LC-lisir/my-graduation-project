package com.mfc.service;

import java.util.List;

import com.mfc.entity.ScSchedul;

 


 

 

public interface  ScSchedulService {
	 
		
	 public void insert(ScSchedul o); 
	 
	 public void update(ScSchedul o);
	 public ScSchedul getById(String  id);   
	 public List<ScSchedul> list(ScSchedul o);
	 public void delete(String id);
}
