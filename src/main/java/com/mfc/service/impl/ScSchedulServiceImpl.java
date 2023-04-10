package com.mfc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mfc.dao.ScSchedulMapper;
import com.mfc.entity.ScSchedul;
import com.mfc.service.ScSchedulService;
 

 

 
 

/**
 *  @author jf3q.com
 *
 */
@Service("scSchedulService")
public class  ScSchedulServiceImpl implements ScSchedulService{

	@Resource
	private ScSchedulMapper scSchedulMapper;

	@Override
	public void insert(ScSchedul o) {
		// TODO Auto-generated method stub
		scSchedulMapper.insert(o);
	}

	@Override
	public void update(ScSchedul o) {
		// TODO Auto-generated method stub
		scSchedulMapper.update(o);
	}

	@Override
	public ScSchedul getById(String id) {
		// TODO Auto-generated method stub
		return scSchedulMapper.getById(id);
	}

	@Override
	public List<ScSchedul> list(ScSchedul o) {
		// TODO Auto-generated method stub
		return scSchedulMapper.list(o);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		scSchedulMapper.delete(id);
	}
	 
 
 

	 
	 

	 
}
