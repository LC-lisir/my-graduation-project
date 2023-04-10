package com.mfc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mfc.dao.ScEmployeesMapper;
import com.mfc.entity.ScEmployees;
import com.mfc.service.ScEmployeesService;
 

 

 
 

/**
 *  @author jf3q.com
 *
 */
@Service("scEmployeesService")
public class   ScEmployeesServiceImpl implements ScEmployeesService{

	@Resource
	private ScEmployeesMapper scEmployeesMapper;

	@Override
	public void insert(ScEmployees o) {
		// TODO Auto-generated method stub
		scEmployeesMapper.insert(o);
	}

	@Override
	public void update(ScEmployees o) {
		// TODO Auto-generated method stub
		scEmployeesMapper.update(o);
	}

	@Override
	public ScEmployees getById(String id) {
		// TODO Auto-generated method stub
		return scEmployeesMapper.getById(id);
	}

	@Override
	public List<ScEmployees> list(ScEmployees o) {
		// TODO Auto-generated method stub
		return scEmployeesMapper.list(o);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		scEmployeesMapper.delete(id);
	}
	 
 
 

	 
	 

	 
}
