package com.mfc.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mfc.dao.ScAdminMapper;
import com.mfc.entity.ScAdmin;
import com.mfc.service.ScAdminService;

 

 
 

/**
 *  @author jf3q.com
 *
 */
@Service("scAdminService")
public class ScAdminServiceImpl implements ScAdminService{

	@Resource
	private ScAdminMapper scAdminMapper;

	@Override
	public ScAdmin login(ScAdmin u) {
		// TODO Auto-generated method stub
		return scAdminMapper.login(u);
	}

	@Override
	public ScAdmin getById(String id) {
		// TODO Auto-generated method stub
		return scAdminMapper.getById(id);
	}

	@Override
	public void update(ScAdmin u) {
		// TODO Auto-generated method stub
		scAdminMapper.update(u);
	}

	 
	 

	 
}
