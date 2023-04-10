package com.mfc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mfc.entity.ScClockin;

 


@Mapper
public interface  ScClockinMapper {
	
	 
	@Select("select select c.*,e.realname,e.uno,d.dname,d.id as department_id from sc_clockin   c LEFT JOIN sc_employees e on e.id=c.employees_id LEFT JOIN sc_department d on e.department_id=d.id   where c.id = #{0}")
    public ScClockin getById(String  id);   
	
	@Insert("insert into sc_clockin (employees_id,cts,day,dkstart_ts,dkend_ts,is_late,leave_early) values (#{employees_id},#{cts},#{day},#{dkstart_ts},#{dkend_ts},#{is_late},#{leave_early}) ")
	@Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")
	public void insert(ScClockin o); 
	
	 
	@Update("<script>update sc_clockin "
			+"<trim prefix=\"set\" suffixOverrides=\",\">"
			+"<if test=\"employees_id != null and employees_id != ''\">employees_id = #{employees_id},</if>"
			+"<if test=\"day != null and day != ''\">day = #{day},</if>"
			+"<if test=\"cts != null and cts != ''\">cts = #{cts},</if>"
			+"<if test=\"dkstart_ts != null and dkstart_ts != ''\">dkstart_ts = #{dkstart_ts},</if>"
			+"<if test=\"dkend_ts != null and dkend_ts != ''\">dkend_ts = #{dkend_ts},</if>"
			+"<if test=\"is_late != null and is_late != ''\">is_late = #{is_late},</if>"
			+"<if test=\"leave_early != null and leave_early != ''\">leave_early = #{leave_early},</if>"
			+"</trim> where id=#{id}</script>")
    public void update(ScClockin o);
	
	
	@Select("<script>select c.*,e.realname,e.uno,d.dname,d.id as department_id from sc_clockin   c LEFT JOIN sc_employees e on e.id=c.employees_id LEFT JOIN sc_department d on e.department_id=d.id where 1=1"
			+"<if test=\"employees_id != null and employees_id !='' \"> and  c.employees_id  = #{employees_id}  </if>"
			+"<if test=\"day != null and day !='' \"> and  c.day like concat('%',#{day},'%')  </if>"
			+"<if test=\"realname != null and realname !='' \"> and  e.realname  = #{realname}  </if>"
			+"<if test=\"uno != null and uno !='' \"> and  e.uno  = #{uno}  </if>"
			+"<if test=\"department_id != null and department_id !='' \"> and  d.id  = #{department_id}  </if>"
			+"<if test=\"start_ts != null and start_ts !='' \"> and  c.cts  &gt;=  #{start_ts}  </if>"
			+"<if test=\"end_ts != null and end_ts !='' \"> and  c.cts &lt;=   #{end_ts}  </if>"
			+"</script>")
    public List<ScClockin> list(ScClockin o);
	
	@Select("<script> select count(id) from sc_clockin where 1=1"
			+"<if test=\"day != null and day !='' \"> and   day like concat('%',#{day},'%')  </if>"
			+"<if test=\"employees_id != null and employees_id !='' \"> and  employees_id  = #{employees_id}  </if>"
			+"<if test=\"is_late != null and is_late !='' \"> and  is_late  = #{is_late}  </if>"
			+"<if test=\"leave_early != null and leave_early !='' \"> and  leave_early  = #{leave_early}  </if>"
			+ "</script>")
    public  Integer getCount(ScClockin o);
	
	
	@Select("<script>select "
			+ "count(c.id) as num,c.*,"
			+ "e.realname,e.department_id "
			+ "from sc_clockin c "
			+ "left   JOIN sc_employees e on e.id=c.employees_id "
			+ "where (  c.is_late=#{is_late} and  e.department_id=#{department_id} and c.day like concat('%',#{day},'%') )"
			+ "GROUP BY c.employees_id  "
			+"</script>")
    public List<ScClockin> getLateNumByDepartment(ScClockin o);
	
	
	@Select("<script>select "
			+ "count(c.id) as num,c.*,"
			+ "e.realname,e.department_id "
			+ "from sc_clockin c "
			+ "left   JOIN sc_employees e on e.id=c.employees_id "
			+ "where  (  c.leave_early=#{leave_early} and  e.department_id=#{department_id} and c.day like concat('%',#{day},'%') )"
			+ "GROUP BY c.employees_id "
			+"</script>")
    public List<ScClockin> getLeaveNumByDepartment(ScClockin o);
	
	
	@Delete("delete from sc_clockin where id = #{0}")
	public void delete(String id);
	 
}