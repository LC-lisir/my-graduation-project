package com.mfc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mfc.entity.ScApply;


@Mapper
public interface  ScApplyMapper {
	
	 
	@Select("select a.*,e.realname,e.uno,d.dname,d.id as department_id from sc_apply a left join sc_employees e on a.employees_id=e.id left join sc_department d on e.department_id=d.id where a.id = #{0}")
    public ScApply getById(String  id);   
	
	@Insert("insert into sc_apply (type,context,start_ts,end_ts,is_audit,result,audit_ts,cts,employees_id) values (#{type},#{context},#{start_ts},#{end_ts},#{is_audit},#{result},#{audit_ts},#{cts},#{employees_id}) ")
	@Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")
	public void insert(ScApply o); 
	
	
	@Update("<script>update sc_apply "
			+"<trim prefix=\"set\" suffixOverrides=\",\">"
			+"<if test=\"type != null and type != ''\">type = #{type},</if>"
			+"<if test=\"context != null and context != ''\">context = #{context},</if>"
			+"<if test=\"start_ts != null and start_ts != ''\">start_ts = #{start_ts},</if>"
			+"<if test=\"end_ts != null and end_ts != ''\">end_ts = #{end_ts},</if>"
			+"<if test=\"is_audit != null and is_audit != ''\">is_audit = #{is_audit},</if>"
			+"<if test=\"result != null and result != ''\">result = #{result},</if>"
			+"<if test=\"audit_ts != null and audit_ts != ''\">audit_ts = #{audit_ts},</if>"
			+"<if test=\"employees_id != null and employees_id != ''\">employees_id = #{employees_id},</if>"
			+"</trim> where id=#{id}</script>")
    public void update(ScApply o);
	
	
	@Select("<script>select a.*,e.realname,e.uno,d.dname,d.id as department_id from sc_apply a left join sc_employees e on a.employees_id=e.id left join sc_department d on e.department_id=d.id where 1=1"
			+"<if test=\"type != null and type !='' \"> and  a.type  = #{type}  </if>"
			+"<if test=\"uno != null and uno !='' \"> and  e.uno  = #{uno}  </if>"
			+"<if test=\"department_id != null and department_id !='' \"> and  d.id  = #{department_id}  </if>"
			+"<if test=\"realname != null and realname !='' \"> and  realname  like concat('%',#{realname},'%') </if>"
			+"<if test=\"employees_id != null and employees_id !='' \"> and  a.employees_id =#{employees_id}</if>"
			+"<if test=\"is_audit != null and is_audit !='' \"> and  is_audit =#{is_audit}</if>"
			+"</script>")
    public List<ScApply> list(ScApply o);
	
	
	@Delete("delete from sc_apply where id = #{0}")
	public void delete(String id);
	 
}