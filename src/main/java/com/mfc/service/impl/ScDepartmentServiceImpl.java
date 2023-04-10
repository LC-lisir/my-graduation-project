package com.mfc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mfc.dao.ScDepartmentMapper;
import com.mfc.entity.ScDepartment;
import com.mfc.service.ScDepartmentService;

/**
 *  @author jf3q.com
 *
 */
@Service("scDepartmentService")
public class  ScDepartmentServiceImpl implements ScDepartmentService{

	@Resource
	private ScDepartmentMapper ScDepartmentMapper;

	@Override
	public void insert(ScDepartment o) {
		// TODO Auto-generated method stub
		ScDepartmentMapper.insert(o);
	}

	@Override
	public void update(ScDepartment o) {
		// TODO Auto-generated method stub
		ScDepartmentMapper.update(o);
	}

	@Override
	public ScDepartment getById(String id) {
		// TODO Auto-generated method stub
		return ScDepartmentMapper.getById(id);
	}

	@Override
	public List<ScDepartment> list(ScDepartment o) {
		// TODO Auto-generated method stub
		return ScDepartmentMapper.list(o);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		ScDepartmentMapper.delete(id);
	}
	 
 
 

	 
	 

	 
}
