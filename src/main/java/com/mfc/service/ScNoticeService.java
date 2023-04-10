package com.mfc.service;

import java.util.List;

import com.mfc.entity.ScNotice;

 


 

 

public interface  ScNoticeService {
	 
		
	 public void insert(ScNotice o); 
	 
	 public void update(ScNotice o);
	 public ScNotice getById(String  id);   
	 public List<ScNotice> list(ScNotice o);
	 public void delete(String id);
}
