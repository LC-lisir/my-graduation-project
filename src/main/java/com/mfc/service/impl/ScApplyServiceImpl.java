package com.mfc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mfc.dao.ScApplyMapper;
import com.mfc.entity.ScApply;
import com.mfc.service.ScApplyService;
 

 

 
 

/**
 *  @author jf3q.com
 *
 */
@Service("scApplyService")
public class   ScApplyServiceImpl implements ScApplyService{

	@Resource
	private ScApplyMapper scApplyMapper;

	@Override
	public void insert(ScApply o) {
		// TODO Auto-generated method stub
		scApplyMapper.insert(o);
	}

	@Override
	public void update(ScApply o) {
		// TODO Auto-generated method stub
		scApplyMapper.update(o);
	}

	@Override
	public ScApply getById(String id) {
		// TODO Auto-generated method stub
		return scApplyMapper.getById(id);
	}

	@Override
	public List<ScApply> list(ScApply o) {
		// TODO Auto-generated method stub
		return scApplyMapper.list(o);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		scApplyMapper.delete(id);
	}
	 
 
 

	 
	 

	 
}
