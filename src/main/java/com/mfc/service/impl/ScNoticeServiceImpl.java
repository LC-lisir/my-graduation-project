package com.mfc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mfc.dao.ScNoticeMapper;
import com.mfc.entity.ScNotice;
import com.mfc.service.ScNoticeService;
 

 

 
 

/**
 *  @author jf3q.com
 *
 */
@Service("scNoticeService")
public class   ScNoticeServiceImpl implements ScNoticeService{

	@Resource
	private ScNoticeMapper scNoticeMapper;

	@Override
	public void insert(ScNotice o) {
		// TODO Auto-generated method stub
		scNoticeMapper.insert(o);
	}

	@Override
	public void update(ScNotice o) {
		// TODO Auto-generated method stub
		scNoticeMapper.update(o);
	}

	@Override
	public ScNotice getById(String id) {
		// TODO Auto-generated method stub
		return scNoticeMapper.getById(id);
	}

	@Override
	public List<ScNotice> list(ScNotice o) {
		// TODO Auto-generated method stub
		return scNoticeMapper.list(o);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		scNoticeMapper.delete(id);
	}
	 
 
 

	 
	 

	 
}
