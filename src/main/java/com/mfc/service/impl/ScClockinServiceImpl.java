package com.mfc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mfc.dao.ScClockinMapper;
import com.mfc.entity.ScClockin;
import com.mfc.service.ScClockinService;
 

 

 
 

/**
 *  @author jf3q.com
 *
 */
@Service("scClockinService")
public class ScClockinServiceImpl implements ScClockinService{

	@Resource
	private ScClockinMapper scClockinMapper;

	@Override
	public void insert(ScClockin o) {
		// TODO Auto-generated method stub
		scClockinMapper.insert(o);
	}

	@Override
	public void update(ScClockin o) {
		// TODO Auto-generated method stub
		scClockinMapper.update(o);
	}

	@Override
	public ScClockin getById(String id) {
		// TODO Auto-generated method stub
		return scClockinMapper.getById(id);
	}

	@Override
	public List<ScClockin> list(ScClockin o) {
		// TODO Auto-generated method stub
		return scClockinMapper.list(o);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		scClockinMapper.delete(id);
	}

	@Override
	public List<ScClockin> getLateNumByDepartment(ScClockin o) {
		// TODO Auto-generated method stub
		return  scClockinMapper.getLateNumByDepartment(o);
	}

	@Override
	public List<ScClockin> getLeaveNumByDepartment(ScClockin o) {
		// TODO Auto-generated method stub
		return scClockinMapper.getLeaveNumByDepartment(o);
	}

	@Override
	public Integer getCount(ScClockin o) {
		// TODO Auto-generated method stub
		return scClockinMapper.getCount(o);
	}
	 
 
 

	 
	 

	 
}
