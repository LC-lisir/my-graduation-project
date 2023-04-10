package com.mfc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mfc.dao.ScSchedulManagerMapper;
import com.mfc.entity.ScSchedulManager;
import com.mfc.service.ScSchedulManagerService;
 

 

 
 

/**
 *  @author jf3q.com
 *
 */
@Service("scSchedulManagerService")
public class   ScSchedulManagerServiceImpl implements ScSchedulManagerService{

	@Resource
	private ScSchedulManagerMapper scSchedulManagerMapper;

	@Override
	public void insert(ScSchedulManager o) {
		// TODO Auto-generated method stub
		scSchedulManagerMapper.insert(o);
	}

	@Override
	public void update(ScSchedulManager o) {
		// TODO Auto-generated method stub
		scSchedulManagerMapper.update(o);
	}

	@Override
	public ScSchedulManager getById(String id) {
		// TODO Auto-generated method stub
		return scSchedulManagerMapper.getById(id);
	}

	@Override
	public List<ScSchedulManager> list(ScSchedulManager o) {
		// TODO Auto-generated method stub
		return scSchedulManagerMapper.list(o);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		scSchedulManagerMapper.delete(id);
	}
	 
 
 

	 
	 

	 
}
