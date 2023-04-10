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
								<h4 class="card-dname">申请单</h4>
								<c:if test="${t.is_audit eq '1' }">已通过审核，不可编辑</c:if>
								<c:if test="${t.is_audit eq '2' }">审核被拒，不可编辑</c:if>
								<form id="applyF" class="form-horizontal form-material" action="${ctx }/apply/save" method="post" onsubmit="return onsub();">
									<input type="hidden" name="id" value="${o.id }" id="id">
									<input type="hidden" name="pageNo" value="${pageNo }">
									<div class="form-group">
										<label class="col-md-12">申请类型</label>
										<div class="col-md-12">
											<select  name="type"  class="form-control" required="required" >
		                                    	<option value="">--类型--</option>
		                                    	<option value="leave" <c:if test="${o.type eq 'leave'}">selected="selected"</c:if>>请假</option>
		                                    	<option value="business_trip" <c:if test="${o.type eq 'business_trip' }">selected="selected"</c:if>>出差</option>
		                                    </select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-12">请假事由</label>
										<div class="col-md-12">
											<textarea   name="context"   required="required" maxlength="200" 
												class="form-control form-control-line">${o.context } </textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-6">请假时间(如果请假一天，请选择相同日期)</label>
										<div class="row">
											<div class="col-md-5">
												<input type="datetime-local" id="start_ts"  name="start_ts" value="${o.start_ts }"   required="required"  
													class="form-control"> 
										 	</div>	
										 	<div class="col-md-1"><hr></div>
											<div class="col-md-5">
												<input type="datetime-local" id="end_ts"  name="end_ts" value="${o.start_ts }"  required="required"  
												class="form-control"> 
											</div>
										</div>
									</div> 
									<div class="form-group">
										<div class="col-sm-12">
										 <c:if test="${empty t.is_audit or t.is_audit == '0' }">
											<button class="btn btn-success" type="submit">提交</button>
										 </c:if>
										 
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
 function onsub(){
	 var s=$('#start_ts').val();
	 var e=$('#end_ts').val();
	 if(s>e){
		 alert('开始时间必须小于或等于结束时间');
		 return false;
	 }
	 return true;
 }
 
 </script>


</html>