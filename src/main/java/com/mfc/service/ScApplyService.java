package com.mfc.service;

import java.util.List;

import com.mfc.entity.ScApply;

 


 

 

public interface   ScApplyService {
	 
		
	 public void insert(ScApply o); 
	 
	 public void update(ScApply o);
	 public ScApply getById(String  id);   
	 public List<ScApply> list(ScApply o);
	 public void delete(String id);
}
