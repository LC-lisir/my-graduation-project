<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<%@ include file="common.jsp"%>
</head>

<body>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
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
								<h4 class="card-title">修改登录密码</h4>
								<form class="form-horizontal form-material" action="${ctx }/admin/updatePwd" method="post" onsubmit="return onsub();">
									
									<div class="form-group">
										<label class="col-md-12">原密码</label>
										<div class="col-md-12">
											<input type="password"  name="old_upass"  required="required"  pattern="(\w){6,20}"
												class="form-control form-control-line"  >
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-md-12">新密码</label>
										<div class="col-md-12">
											<input type="password"  name="new_upass"  required="required"  pattern="(\w){6,20}"
												class="form-control form-control-line"  >
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-md-12">确认密码</label>
										<div class="col-md-12">
											<input type="password"  name="new_upass2"  required="required"  pattern="(\w){6,20}"
												class="form-control form-control-line"  >
										</div>
									</div>
									
									
									 
									<div class="form-group">
										<div class="col-sm-12">
										    <p style="color:red;">${msg }</p>
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