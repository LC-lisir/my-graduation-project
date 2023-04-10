<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<%@ include file="common.jsp"%>
</head>

<body>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinnero.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pageo.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pageo.scss -->
		<!-- ============================================================== -->
		<%@ include file="leftmenu.jsp"%>
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->

			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!-- Row -->
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-dname">编辑排班信息</h4>
								<form class="form-horizontal form-material" action="${ctx }/schedulManager/save" method="post" onsubmit="return onsub();">
									<input type="hidden" name="id" value="${o.id }" id="id">
									<input type="hidden" name="pageNo" value="${pageNo }">
									
								 
									
									<div class="form-group">
										<label class="col-md-12">选择护士</label>
										<div class="col-md-12">
											<input type="text" id="realname" name="realname" value="${o.realname }" required="required" maxlength="40" readonly="readonly"
												class="form-control form-control-line">
											<input type="hidden" name="employees_id" id="employees_id" value="${o.employees_id }" >
										</div>
									</div> 
									
									 
									<div class="form-group">
										<label class="col-md-12">排班日期</label>
										<div class="col-md-12">
											 <div class="row">
											 	<div  class="col-sm-6" >
											 		<input type="date" name="day" id="day" value="${o.day }" required="required" class="form-control form-control-line">
											 	</div>
											  
											 	<div class="col-sm-6">
											 		  <select  name="start_ts"    style="width: 45%;float:left;" class="form-control ">
															
															<option value="00:00" <c:if test="${o.start_ts eq '00:00' }">selected="selected"</c:if>>00:00</option>	
															<option value="01:00" <c:if test="${o.start_ts eq '01:00' }">selected="selected"</c:if>>01:00</option>	
															<option value="02:00" <c:if test="${o.start_ts eq '02:00' }">selected="selected"</c:if>>02:00</option>	
															<option value="03:00" <c:if test="${o.start_ts eq '03:00' }">selected="selected"</c:if>>03:00</option>	
															<option value="04:00" <c:if test="${o.start_ts eq '04:00' }">selected="selected"</c:if>>04:00</option>	
															<option value="05:00" <c:if test="${o.start_ts eq '05:00' }">selected="selected"</c:if>>05:00</option>	
															<option value="06:00" <c:if test="${o.start_ts eq '06:00' }">selected="selected"</c:if>>06:00</option>	
															<option value="07:00" <c:if test="${o.start_ts eq '07:00' }">selected="selected"</c:if>>07:00</option>	
															<option value="08:00" <c:if test="${o.start_ts eq '08:00' }">selected="selected"</c:if>>08:00</option>	
															<option value="09:00" <c:if test="${o.start_ts eq '09:00' }">selected="selected"</c:if>>09:00</option>	
															<option value="10:00" <c:if test="${o.start_ts eq '10:00' }">selected="selected"</c:if>>10:00</option>	
															<option value="11:00" <c:if test="${o.start_ts eq '11:00' }">selected="selected"</c:if>>11:00</option>	
															<option value="12:00" <c:if test="${o.start_ts eq '12:00' }">selected="selected"</c:if>>12:00</option>	
															<option value="13:00" <c:if test="${o.start_ts eq '13:00' }">selected="selected"</c:if>>13:00</option>	
															<option value="14:00" <c:if test="${o.start_ts eq '14:00' }">selected="selected"</c:if>>14:00</option>	
															<option value="15:00" <c:if test="${o.start_ts eq '15:00' }">selected="selected"</c:if>>15:00</option>	
															<option value="16:00" <c:if test="${o.start_ts eq '16:00' }">selected="selected"</c:if>>16:00</option>	
															<option value="17:00" <c:if test="${o.start_ts eq '17:00' }">selected="selected"</c:if>>17:00</option>	
															<option value="18:00" <c:if test="${o.start_ts eq '18:00' }">selected="selected"</c:if>>18:00</option>	
															<option value="19:00" <c:if test="${o.start_ts eq '19:00' }">selected="selected"</c:if>>19:00</option>	
															<option value="20:00" <c:if test="${o.start_ts eq '20:00' }">selected="selected"</c:if>>20:00</option>	
															<option value="21:00" <c:if test="${o.start_ts eq '21:00' }">selected="selected"</c:if>>21:00</option>	
															<option value="22:00" <c:if test="${o.start_ts eq '22:00' }">selected="selected"</c:if>>22:00</option>	
															<option value="23:00" <c:if test="${o.start_ts eq '23:00' }">selected="selected"</c:if>>23:00</option>	
														</select>
														<span style="float:left;">-</span>
														<select name="end_ts"  style="width: 45%;float:left;" class="form-control">
															
															<option value="00:00" <c:if test="${o.end_ts eq '00:00' }">selected="selected"</c:if>>00:00</option>	
															<option value="01:00" <c:if test="${o.end_ts eq '01:00' }">selected="selected"</c:if>>01:00</option>	
															<option value="02:00" <c:if test="${o.end_ts eq '02:00' }">selected="selected"</c:if>>02:00</option>	
															<option value="03:00" <c:if test="${o.end_ts eq '03:00' }">selected="selected"</c:if>>03:00</option>	
															<option value="04:00" <c:if test="${o.end_ts eq '04:00' }">selected="selected"</c:if>>04:00</option>	
															<option value="05:00" <c:if test="${o.end_ts eq '05:00' }">selected="selected"</c:if>>05:00</option>	
															<option value="06:00" <c:if test="${o.end_ts eq '06:00' }">selected="selected"</c:if>>06:00</option>	
															<option value="07:00" <c:if test="${o.end_ts eq '07:00' }">selected="selected"</c:if>>07:00</option>	
															<option value="08:00" <c:if test="${o.end_ts eq '08:00' }">selected="selected"</c:if>>08:00</option>	
															<option value="09:00" <c:if test="${o.end_ts eq '09:00' }">selected="selected"</c:if>>09:00</option>	
															<option value="10:00" <c:if test="${o.end_ts eq '10:00' }">selected="selected"</c:if>>10:00</option>	
															<option value="11:00" <c:if test="${o.end_ts eq '11:00' }">selected="selected"</c:if>>11:00</option>	
															<option value="12:00" <c:if test="${o.end_ts eq '12:00' }">selected="selected"</c:if>>12:00</option>	
															<option value="13:00" <c:if test="${o.end_ts eq '13:00' }">selected="selected"</c:if>>13:00</option>	
															<option value="14:00" <c:if test="${o.end_ts eq '14:00' }">selected="selected"</c:if>>14:00</option>	
															<option value="15:00" <c:if test="${o.end_ts eq '15:00' }">selected="selected"</c:if>>15:00</option>	
															<option value="16:00" <c:if test="${o.end_ts eq '16:00' }">selected="selected"</c:if>>16:00</option>	
															<option value="17:00" <c:if test="${o.end_ts eq '17:00' }">selected="selected"</c:if>>17:00</option>	
															<option value="18:00" <c:if test="${o.end_ts eq '18:00' }">selected="selected"</c:if>>18:00</option>	
															<option value="19:00" <c:if test="${o.end_ts eq '19:00' }">selected="selected"</c:if>>19:00</option>	
															<option value="20:00" <c:if test="${o.end_ts eq '20:00' }">selected="selected"</c:if>>20:00</option>	
															<option value="21:00" <c:if test="${o.end_ts eq '21:00' }">selected="selected"</c:if>>21:00</option>	
															<option value="22:00" <c:if test="${o.end_ts eq '22:00' }">selected="selected"</c:if>>22:00</option>	
															<option value="23:00" <c:if test="${o.end_ts eq '23:00' }">selected="selected"</c:if>>23:00</option>	
														</select>
											 	</div>
											 	 
											 </div>
											 
										</div>
										<div id="tip" class="col-md-12"></div>
									</div> 
									 
									 <div class="form-group">
										<label class="col-md-12">备注</label>
										<div class="col-md-12">
											<textarea   name="note"  maxlength="200"   class="form-control form-control-line"> ${o.note }</textarea>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-sm-12">
										 
											<button class="btn btn-success" type="submit">提交</button>
										 <button class="btn btn-warning" type="reset">重置</button>
										 
										 
										</div>
									</div>
								</form>
							</div>

						</div>

					</div>

				</div>
				<!-- Row -->
				<!-- ============================================================== -->
				<!-- End PAge Content -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- Right sidebar -->
				<!-- ============================================================== -->
				<!-- .right-sidebar -->
				<!-- ============================================================== -->
				<!-- End Right sidebar -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>



<!-- 模态框（Modal） -->
<div class="modal fade" id="choose_employees" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
					选择护士
				</h4>
			</div>
			<div class="modal-body" id="seeinfo_body">
				<form class="form-inline" action="#" method="post" id="employees_search_form">
                    <div class="row">
	                    <div class="col-sm-3">
		                    <div class="form-group">
		                        <input type="text" name="uno"   class="form-control"  placeholder="护士编号"  style="width:100%;">
		                    </div>
	                    </div>
                    	<div class="col-sm-3">
		                    <div class="form-group">
		                        <input type="text" name="realname"   class="form-control"  placeholder="护士姓名" style="width:100%;">
		                    </div>
	                    </div>
	                    <div class="col-sm-3">
		                    <div class="form-group">
		                         <select  name="department_id"  class="form-control" style="width: 100%;">
                                   	<option value="">所属科室</option>
                                   	<c:forEach items="${deli }" var="t">
                                   		<option value="${t.id }">${t.dname }</option>
                                   	</c:forEach>
                                  </select>
		                    </div>
	                    </div>
	                    <div class="col-sm-3">
		                    <div class="form-group">
		                         <button type="button" class="btn btn-success" id="search_employees_btn">搜索</button>
		                    </div>
	                    </div>
               		</div>
                </form>
				<table class="table table-striped  table-hover">
				  <thead>
				    <tr>
				      <th>编号</th>
				      <th>姓名</th>
				      <th>所属科室</th>
				    </tr>
				  </thead>
				  <tbody id="employees_show">
				  </tbody>
				</table>
				<div style="text-align: center;">
					<p id="more_tip" data-p=1></p>
					<a href="javascript:;"  id="pre_p">上一页/</a>
					<a href="javascript:;"   id="next_p">下一页</a>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				 
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>



</body>
<script type="text/javascript">
$('#realname').click(function(){
	$('#choose_employees').modal('show');
	get_employees();
})
$('#search_employees_btn').click(function(){
	get_employees();
})
function get_employees(){
	var uno=$('#employees_search_form input[name=uno]').val();
	var realname=$('#employees_search_form input[name=realname]').val();
	var department_id=$('#employees_search_form select[name=department_id]').val();
	var pageNo=parseInt($('#more_tip').attr('data-p'));
	 
	$.ajax({
	    url: '${ctx}/employees/page_ajax',
		type: 'post',
		data: {uno:uno,realname:realname,department_id:department_id,pageNo:pageNo},
		dataType: 'json',
		success:function(data){
			if(data.hasNextPage==false)$('#next_p').hide();
			else $('#next_p').show();
			if(data.hasPreviousPage==false)$('#pre_p').hide();
			else $('#pre_p').show();
			
			if(data.total==0)$('#more_tip').text('没有数据了');
			else{
				$('#more_tip').text('共'+data.total+'数据，共'+data.pages+'页');
			}
			var s="";
			for(var i=0;i<data.list.length;i++){
				s+='<tr data-eid='+data.list[i].id+' data-realname="'+data.list[i].realname+'" data-uno="'+data.list[i].uno+'" data-dname="'+data.list[i].dname+'"><td>'+data.list[i].uno+'</td><td>'+data.list[i].realname+'</td><td>'+data.list[i].dname+'</td></tr>';
			} 
			$('#employees_show').html(s);
		}
	})
	
} 

$('#employees_show').on('click','tr',function(){
	var eid=$(this).attr('data-eid');
	var realname=$(this).attr('data-realname');
	var uno=$(this).attr('data-uno');
	var dname=$(this).attr('data-dname');
	$('#realname').val(realname+"[编号："+uno+"，"+dname+"]");
	$('#employees_id').val(eid);
	$('#choose_employees').modal('hide');
})

$('#next_p').click(function(){
	var pageNo=parseInt($('#more_tip').attr('data-p'))+1;
	$('#more_tip').attr('data-p',pageNo);
	get_employees();
})
$('#pre_p').click(function(){
	var pageNo=parseInt($('#more_tip').attr('data-p'))-1;
	if(pageNo>0){
		$('#more_tip').attr('data-p',pageNo);
		get_employees();
	}
	
})

$('#day').change(function(){
	var day=$('#day').val();
	var employees_id=$('#employees_id').val();
	if($.trim(employees_id).length==0){
		alert('请选择护士');
		$('#day').val('');
		return;
	}
	if($.trim(day).length==0){
		$('#tip').val('');
		return;
	}
	 can_schedul(day);
})

 
 
function can_schedul(day){
	var employees_id=$('#employees_id').val();
	$.ajax({
	    url: '${ctx}/schedulManager/canSchedul',
		type: 'post',
		data: {employees_id:employees_id,day:day},
		dataType: 'json',
		success:function(data){
			if(data.status==1){
				$('#tip').html('<b style="color:green">'+data.msg+'</b>');
			}else{
				$('#tip').html('<b style="color:red">'+data.msg+'</b>');
			} 
		}
	})
}

function onsub(){
	var employees_id=$('#employees_id').val();
	if($.trim(employees_id).length==0){
		alert('请选择护士');
		return false;
	}
	 
 
	return true;
}

</script>
</html>