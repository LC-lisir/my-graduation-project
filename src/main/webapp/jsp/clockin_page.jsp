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
                                <h4 class="card-dname">打卡信息</h4>
                               <form class="form-inline m-t-30" action="${ctx }/clockin/page" method="post">
	                                 <div class="form-group">
	                                    <input type="text" name="uno" value="${o.uno }" class="form-control"  placeholder="用户编号">
	                                </div>
	                                <div class="form-group">
	                                    <input type="text" name="realname" value="${o.realname }" class="form-control"  placeholder="用户姓名">
	                                </div>
	                                 <div class="form-group">
	                                    <select  name="department_id"  class="form-control" >
	                                    	<option value="">--所属科室--</option>
	                                    	<c:forEach items="${deli }" var="t">
	                                    		<option value="${t.id }" <c:if test="${o.department_id eq t.id }">selected="selected"</c:if>>${t.dname }</option>
	                                    		
	                                    	</c:forEach>
	                                    </select>
	                                </div> 
	                                <div class="form-group">
	                                    <input type="date" name="start_ts" value="${o.start_ts }" class="form-control"  placeholder="开始时间">
	                                </div>
	                                 <div class="form-group">
	                                    <input type="date" name="end_ts" value="${o.end_ts }" class="form-control"  placeholder="结束时间">
	                                </div> 
	                                <div class="form-group">
	                                	<button class="btn btn-success" type="submit">查找</button>
	                                	 
	                           		</div>
	                            </form>
                            </div>
                            
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">护士编号</th>
                                            <th scope="col">姓名</th>
                                            <th scope="col">科室</th>
                                            <th scope="col">打卡时间</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageInfo.list }" var="t">
                                        <tr>
                                            <td>${t.uno }</td> 
                                            <td>${t.realname }</td> 
                                            <td>${t.dname }</td> 
                                            <td>${t.cts}</td> 
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                
                                <form method="post" action="${ctx }/clockin/page">
                                 <input type="hidden" name="start_ts" value="${o.start_ts }">
                                 <input type="hidden" name="end_ts" value="${o.end_ts }">
                                 <input type="hidden" name="uno" value="${o.uno }">
                                 <input type="hidden" name="realname" value="${o.realname }">
                                 <input type="hidden" name="department_id" value="${o.department_id }">
                                   <%@ include file="page.jsp"%>
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

$('.del').click(function(){
	if(confirm('确定删除？'))window.location=$(this).attr('data-href');
})
</script>
</html>