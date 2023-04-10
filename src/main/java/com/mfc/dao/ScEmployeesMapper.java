package com.mfc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mfc.entity.ScEmployees;


@Mapper
public interface ScEmployeesMapper {
	
	 
	@Select("select e.*,d.dname from sc_employees e  left join sc_department d on e.department_id=d.id  where  e.id = #{0}")
    public ScEmployees getById(String  id);   
	
	@Insert("insert into sc_employees (uno,upass,sex,borth,department_id,realname,cts,faceimg) values (#{uno},#{upass},#{sex},#{borth},#{department_id},#{realname},#{cts},#{faceimg}) ")
	@Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")
	public void insert(ScEmployees o); 
	
	
	@Update("<script>update sc_employees "
			+"<trim prefix=\"set\" suffixOverrides=\",\">"
			+"<if test=\"uno != null and uno != ''\">uno = #{uno},</if>"
			+"<if test=\"upass != null and upass != ''\">upass = #{upass},</if>"
			+"<if test=\"sex != null and sex != ''\">sex = #{sex},</if>"
			+"<if test=\"borth != null and borth != ''\">borth = #{borth},</if>"
			+"<if test=\"department_id != null and department_id != ''\">department_id = #{department_id},</if>"
			+"<if test=\"realname != null and realname != ''\">realname = #{realname},</if>"
			+"<if test=\"faceimg != null and faceimg != ''\">faceimg = #{faceimg},</if>"
			+"</trim> where id=#{id}</script>")
    public void update(ScEmployees o);
	
	
	@Select("<script>select e.*,d.dname from sc_employees e left join sc_department d on e.department_id=d.id where 1=1"
			+"<if test=\"realname != null and realname !='' \"> and  realname  like concat('%',#{realname},'%') </if>"
			+"<if test=\"uno != null and uno !='' \"> and  uno  = #{uno}  </if>"
			+"<if test=\"upass != null and upass !='' \"> and  upass  = #{upass}  </if>"
			+"<if test=\"department_id != null and department_id !='' \"> and  department_id  = #{department_id}  </if>"
			+"</script>")
    public List<ScEmployees> list(ScEmployees o);
	
	
	@Delete("delete from sc_employees where id = #{0}")
	public void delete(String id);
	 
}