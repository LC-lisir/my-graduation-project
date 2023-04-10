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
                                <h4 class="card-dname">
           <c:if test="${empty o.employees_id }"> 我的</c:if>                     
           <c:if test="${not empty o.employees_id }">${emp.realname }</c:if>                     
                                排班历史信息查询   <a href="${ctx }/schedulManager/mycal?employees_id=${o.employees_id}">查看当月排版</a></h4>
                              <p>默认显示当月排班信息，如需查看其他月的信息，请重新选择时间</p>
                                 <form class="form-inline m-t-30" action="${ctx }/schedulManager/mypage" method="post">
	                                   <input type="hidden" name="employees_id" value="${o.employees_id }"> 
	                                 <div class="form-group">
	                                    <input type="date" name="start_ts1" value="${o.start_ts1 }" class="form-control"  placeholder="开始时间">
	                                </div>
	                                 <div class="form-group">
	                                    <input type="date" name=end_ts1 value="${o.end_ts1 }" class="form-control"  placeholder="结束时间">
	                                </div>  
	                                <div class="form-group">
	                                	<button class="btn btn-success" type="submit">查找</button>
	                           		</div>
	                            </form>
                               
                            </div>
                            <p style="color:red;">${msg }</p>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">排班时间</th>
                                            <th scope="col">备注</th>
                                            <th scope="col">创建时间</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageInfo.list }" var="t">
                                        <tr>
                                            <td>${t.day} ${t.start_ts }-${t.end_ts }</td> 
                                            <td>${t.note}</td> 
                                            <td>${t.cts}</td> 
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                 <p style="color:red;">${msg }</p>
                                <form method="post" action="${ctx }/schedulManager/mypage">
                                 <input type="hidden" name="employees_id" value="${o.employees_id }"> 
                                   <input type="hidden" name="start_ts1" value="${o.start_ts1 }">
                                   <input type="hidden" name="end_ts1" value="${o.end_ts1 }">
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