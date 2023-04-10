package com.mfc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mfc.entity.ScSchedulManager;


@Mapper
public interface ScSchedulManagerMapper {
	
	 
	@Select("select sm.*,e.uno,e.realname,d.id as department_id,d.dname  from sc_schedul_manager sm left join sc_employees e on e.id=sm.employees_id left join sc_department d on d.id=e.department_id  where sm.id = #{0}")
    public ScSchedulManager getById(String  id);   
	
	@Insert("insert into sc_schedul_manager (start_ts,end_ts,note,employees_id,cts,day,type) values (#{start_ts},#{end_ts},#{note},#{employees_id},#{cts},#{day},#{type}) ")
	@Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")
	public void insert(ScSchedulManager o); 
	
	
	@Update("<script>update sc_schedul_manager "
			+"<trim prefix=\"set\" suffixOverrides=\",\">"
			+"<if test=\"start_ts != null and start_ts != ''\">start_ts = #{start_ts},</if>"
			+"<if test=\"end_ts != null and end_ts != ''\">end_ts = #{end_ts},</if>"
			+"<if test=\"note != null and start_ts != ''\">note = #{note},</if>"
			+"<if test=\"employees_id != null and employees_id != ''\">employees_id = #{employees_id},</if>"
			+"<if test=\"day != null and day != ''\">day = #{day},</if>"
			+"<if test=\"type != null and type != ''\">type = #{type},</if>"
			+"</trim> where id=#{id}</script>")
    public void update(ScSchedulManager o);
	
	
	@Select("<script>select sm.*,e.uno,e.realname,d.id as department_id,d.dname  from sc_schedul_manager sm left join sc_employees e on e.id=sm.employees_id left join sc_department d on d.id=e.department_id  where 1=1"
			+"<if test=\"uno != null and uno !='' \"> and  e.uno  =#{uno} </if>"
			+"<if test=\"realname != null and realname !='' \"> and  e.realname  like concat('%',#{realname},'%') </if>"
			+"<if test=\"department_id != null and department_id !='' \"> and d.id  =#{department_id} </if>"
			+"<if test=\"start_ts1 != null and start_ts1 !='' \"> and sm.day  &gt;=  #{start_ts1} </if>"
			+"<if test=\"end_ts1 != null and end_ts1 !='' \"> and sm.day  &lt;=  #{end_ts1} </if>"
			+"<if test=\"day != null and day !='' \"> and sm.day like concat('%',#{day},'%') </if>"
			+"<if test=\"employees_id != null and employees_id !='' \"> and sm.employees_id = #{employees_id} </if>"
			+"</script>")
    public List<ScSchedulManager> list(ScSchedulManager o);
	
	
	@Delete("delete from sc_schedul_manager where id = #{0}")
	public void delete(String id);
	 
}