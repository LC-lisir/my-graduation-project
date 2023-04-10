package com.mfc.service;

 

import com.mfc.entity.ScAdmin;

 

 

public interface ScAdminService {
	public ScAdmin login(ScAdmin u); 
	
	 
	 
    public ScAdmin getById(String id);
	
    public void update(ScAdmin u);
    
    
}
