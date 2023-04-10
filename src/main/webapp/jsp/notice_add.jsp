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
								<h4 class="card-title">添加&编辑公告信息</h4>
								<form class="form-horizontal form-material" action="${ctx }/notice/save" method="post" onsubmit="return onsub();">
									<input type="hidden" name="id" value="${o.id }" id="id">
									<input type="hidden" name="pageNo" value="${pageNo }">
									
									 
									
									<div class="form-group">
										<label class="col-md-12">标题</label>
										<div class="col-md-12">
											<input type="text"  name="title" value="${o.title }" required="required" maxlength="200"
												class="form-control form-control-line">
										</div>
									</div>
									 <div class="form-group">
										<label class="col-md-12">内容</label>
										<div class="col-md-12">
											<textarea    name="context"  required="required" maxlength="10000"
												class="form-control form-control-line">${o.context }</textarea>
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