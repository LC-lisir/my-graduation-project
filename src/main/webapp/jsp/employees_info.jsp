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
    <div id="main-wrapper" data-navbarbg="skin6" data-theme="light" data-layout="vertical" data-sidebartype="full" data-boxed-layout="full">
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
                                <h4 class="card-title" style="text-align: center;">个人基本信息</h4>
                              
                            </div>
                           
                            <div class="container">
                                  <table class="table table-bordered table-responsive-lg" style="width:50%;margin-left: 25%;text-align: center;">
                                     <tr>
                                            <td style="background: #f2f2f2;">电子照:</td>
                                            <td><img src='${ctx}/${o.faceimg }' style="width: 200px;"></td>
                                        </tr>
                                    	 <tr>
                                            <td style="background: #f2f2f2;">编号:</td>
                                            <td>${o.uno }</td>
                                        </tr>
                                        <tr>
                                            <td style="background: #f2f2f2;">姓名:</td>
                                            <td>${o.realname }</td>
                                        </tr>
                           				 <tr>
                                            <td style="background: #f2f2f2;">性别:</td>
                                            <td>${o.sex }</td>
                                        </tr>	
                                    	<tr>
                                            <td style="background: #f2f2f2;">生日:</td>
                                            <td>${o.borth }</td>
                                        </tr>
                                        <tr>
                                            <td style="background: #f2f2f2;">所属科室:</td>
                                            <td>${o.dname }</td>
                                        </tr>
                                         <tr>
                                            <td style="background: #f2f2f2;">创建时间:</td>
                                            <td>${o.cts }</td>
                                        </tr>
                                </table>
                                       
                                                       
                                
                                 
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