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
								<h4 class="card-realname">添加&编辑护士信息</h4>
								<form enctype="multipart/form-data" class="form-horizontal form-material" action="${ctx }/employees/save" method="post" onsubmit="return onsub();">
									<input type="hidden" name="id" value="${o.id }" id="id">
									<input type="hidden" name="pageNo" value="${pageNo }">
									<input type="hidden" name="sertype" value="${o.sertype}">
									
									 <div class="form-group">
										<label class="col-md-12">护士编码(编码由4位数字组成,初始密码：123456)<span id="check_no_tip"></span></label>
										<div class="col-md-12">
											<input  data-c=0  type="text"  name="uno" id="uno" value="${o.uno }"  pattern="\d{4}" required="required"  
												class="form-control form-control-line" <c:if test="${not empty o.id }"> readonly="readonly"</c:if>>
												
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-md-12">护士姓名</label>
										<div class="col-md-12">
											<input type="text"  name="realname" value="${o.realname }" required="required" maxlength="10"
												class="form-control form-control-line">
										</div>
									</div>
									
									
									<div class="form-group">
										<label class="col-md-12">一寸电子照</label>
										<div class="col-md-12">
											<input type="file"  name="file"   id="faceimg_file"   <c:if test="${empty o.id }">required="required"</c:if> maxlength="10"
												class="form-control form-control-line" accept="image/*">
											 
											<img src="${ctx }/${o.faceimg }" id="faceimg_show" style="<c:if test='${empty o.faceimg }'>display: none;</c:if>width:200px;">
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-md-12">性别</label>
										<div class="col-md-12">
											<input type="radio" <c:if test="${o.sex eq '男' }"> checked="checked"</c:if>  name="sex" value="男" required="required" class="form-controle">男
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" <c:if test="${o.sex eq '女' }"> checked="checked"</c:if> name="sex" value="女" required="required" class="form-controle">女
										
										
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-12">生日</label>
										<div class="col-md-12">
											<input type="date"  name="borth" value="${o.borth }" required="required" 
												class="form-control form-control-line">
										</div>
									</div> 
									<div class="form-group">
										<label class="col-md-12">所属科室</label>
										<div class="col-md-12">
											<select  name="department_id"  class="form-control  form-control-line"  required="required">
	                                    	<option value=""></option>
	                                    	<c:forEach items="${deli }" var="t">
	                                    		<option value="${t.id }" <c:if test="${o.department_id eq t.id }">selected="selected"</c:if>>${t.dname }</option>
	                                    		
	                                    	</c:forEach>
	                                    </select>
										</div>
									</div> 
									
									
									
	                                    
									<div class="form-group">
										<div class="col-sm-12">
										 	<p style="color:red">${msg }</p>
											<button class="btn btn-success" type="submit">提交</button>
										 
										 
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

</body>
<script type="text/javascript">

$('#uno').change(function(){
	var id=$('#id').val();
	if(id.length>0)return;
	var uno=$('#uno').val();
	if( !checkstuNo(uno)){
		$('#check_no_tip').html('<b style="color:red;">编号格式不正确</b>');
		return;
	}
	$('#check_no_tip').html('');
	 
	check_uno(uno);
	 
	
})

function check_uno(uno){
	$.ajax({
	    url: '${ctx}/employees/check_uno',
		type: 'post',
		data: {uno:uno},
		dataType: 'json',
		success:function(data){
			if(data.status==1){
				$('#uno').attr('data-c',1);
				$('#check_no_tip').html('<b style="color:green;">'+data.msg+'</b>')
			}else{
				$('#check_no_tip').html('<b style="color:red;">'+data.msg+'</b>')
			}
		}
	})
}

function checkstuNo(no){ 
    if((/^\d{4}$/.test(no))){ 
        return true;
    }else return false;
}
 
function onsub(){
	var id=$('#id').val();
	if(id.length>0)return true;
	var c=$('#uno').attr('data-c');
	if(c!=1){
		return false;
	}
	return true;
}


 

$('#faceimg_file').change(function(){
	var f=this.files[0];
	 var objUrl = getObjectURL(f) ; //获取图片的路径，该路径不是图片在本地的路径
     if (objUrl) {
    	 if(f.size>1*1024*1024){
    		 alert('图片最大1M');return;
    	 }
       $("#faceimg_show").attr("src", objUrl).show() ; //将图片路径存入src中，显示出图片
     }
});

function getObjectURL(file) {
    var url = null ;
    if (window.createObjectURL!=undefined) { // basic
        url = window.createObjectURL(file) ;
    } else if (window.URL!=undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file) ;
    } else if (window.webkitURL!=undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file) ;
    }
    return url ;
}
</script>
</html>