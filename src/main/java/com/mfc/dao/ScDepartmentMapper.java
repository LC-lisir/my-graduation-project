package com.mfc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mfc.entity.ScDepartment;


@Mapper
public interface ScDepartmentMapper {
	
	 
	@Select("select * from sc_department where id = #{0}")
    public ScDepartment getById(String  id);   
	
	@Insert("insert into sc_department (dname,cts) values (#{dname},#{cts}) ")
	@Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")
	public void insert(ScDepartment o); 
	
	
	@Update("<script>update sc_department "
			+"<trim prefix=\"set\" suffixOverrides=\",\">"
			+"<if test=\"dname != null and dname != ''\">dname = #{dname},</if>"
			+"</trim> where id=#{id}</script>")
    public void update(ScDepartment o);
	
	
	@Select("<script>select * from sc_department where 1=1"
			+"<if test=\"dname != null and dname !='' \"> and  dname  like concat('%',#{dname},'%') </if>"
			+"</script>")
    public List<ScDepartment> list(ScDepartment o);
	
	
	@Delete("delete from sc_department where id = #{0}")
	public void delete(String id);
	 
}