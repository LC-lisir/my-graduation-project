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
								<h4 class="card-sname">排班设置</h4>
								<form class="form-horizontal form-material" action="${ctx }/schedul/save" method="post" onsubmit="return onsub();">
									<input type="hidden" name="id" value="${o.id }" id="id">
									<input type="hidden" name="pageNo" value="${pageNo }">
									
									 
									
									<div class="form-group">
										<label class="col-md-12">名称</label>
										<div class="col-md-12">
											<input type="text"  name="sname" value="${o.sname }" required="required" maxlength="40"
												class="form-control form-control-line">
										</div>
									</div>
									 
									 <div class="form-group">
										<label class="col-md-12">开始时间</label>
										<div class="col-md-12">
											<select    name="start_ts" value="${o.start_ts }" required="required" 
												class="form-control form-control-line">
												
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
										</div>
									</div>
									 <div class="form-group">
										<label class="col-md-12">结束时间</label>
										<div class="col-md-12">
											<select    name="end_ts" value="${o.end_ts }" required="required" 
												class="form-control form-control-line">
												
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
									 
									<div class="form-group">
										<div class="col-sm-12">
										 
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

 

</script>
</html>