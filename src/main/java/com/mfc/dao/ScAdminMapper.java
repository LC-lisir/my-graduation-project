package com.mfc.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.mfc.entity.ScAdmin;


@Mapper
public interface ScAdminMapper {
	
	@Select("select * from sc_admin where uname = #{uname} and upass=#{upass}")
    public ScAdmin login(ScAdmin u); 
	
	 
	 
	@Select("select * from sc_admin where id=#{id}")
    public ScAdmin getById(String id);
	
	@Select("update sc_admin set  upass=#{upass}  where id=#{id}")
    public void update(ScAdmin u);
	
	 
}