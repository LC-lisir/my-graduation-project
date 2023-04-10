package com.mfc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mfc.entity.ScSchedul;


@Mapper
public interface ScSchedulMapper {
	
	 
	@Select("select * from sc_schedul where id = #{0}")
    public ScSchedul getById(String  id);   
	
	@Insert("insert into sc_schedul (sname,start_ts,end_ts,cts) values (#{sname},#{start_ts},#{end_ts},#{cts}) ")
	@Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")
	public void insert(ScSchedul o); 
	
	
	@Update("<script>update sc_schedul "
			+"<trim prefix=\"set\" suffixOverrides=\",\">"
			+"<if test=\"sname != null and sname != ''\">sname = #{sname},</if>"
			+"<if test=\"start_ts != null and start_ts != ''\">start_ts = #{start_ts},</if>"
			+"<if test=\"end_ts != null and end_ts != ''\">end_ts = #{end_ts},</if>"
			+"</trim> where id=#{id}</script>")
    public void update(ScSchedul o);
	
	
	@Select("<script>select * from sc_schedul where 1=1"
			+"<if test=\"sname != null and sname !='' \"> and  sname  like concat('%',#{sname},'%') </if>"
			+"</script>")
    public List<ScSchedul> list(ScSchedul o);
	
	
	@Delete("delete from sc_schedul where id = #{0}")
	public void delete(String id);
	 
}