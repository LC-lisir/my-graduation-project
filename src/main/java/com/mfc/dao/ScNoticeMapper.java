package com.mfc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mfc.entity.ScNotice;


@Mapper
public interface  ScNoticeMapper {
	
	 
	@Select("select * from sc_notice where id = #{0}")
    public ScNotice getById(String  id);   
	
	@Insert("insert into sc_notice (title,context,cts) values (#{title},#{context},#{cts}) ")
	@Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")
	public void insert(ScNotice o); 
	
	
	@Update("<script>update sc_notice "
			+"<trim prefix=\"set\" suffixOverrides=\",\">"
			+"<if test=\"title != null and title != ''\">title = #{title},</if>"
			+"<if test=\"context != null and context != ''\">context = #{context},</if>"
			+"</trim> where id=#{id}</script>")
    public void update(ScNotice o);
	
	
	@Select("<script>select * from sc_notice where 1=1"
			+"<if test=\"title != null and title !='' \"> and  title  like concat('%',#{title},'%') </if>"
			+"</script>")
    public List<ScNotice> list(ScNotice o);
	
	
	@Delete("delete from sc_notice where id = #{0}")
	public void delete(String id);
	 
}