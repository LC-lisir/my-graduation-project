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
                                历史打卡信息查询   <a href="${ctx }/clockin/mycal?employees_id=${o.employees_id}">打卡信息</a></h4>
                               <form class="form-inline m-t-30" action="${ctx }/clockin/mypage" method="post">
	                                 <input type="hidden" name="employees_id" value="${o.employees_id }"> 
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
                            <p style="color:red;">${msg }</p>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col"></th>
                                            <th scope="col">日期</th>
                                            <th scope="col">打卡开始时间</th>
                                            <th scope="col">打卡结束时间</th>
                                            <th scope="col">是否迟到</th>
                                            <th scope="col">是否早退</th>
                                            <th scope="col">创建时间</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageInfo.list }" var="t">
                                        <tr> 
                                            <td> 已打卡</td> 
                                            <td> ${t.day }</td> 
                                            <td>${t.dkstart_ts}</td> 
                                            <td>${t.dkend_ts}</td> 
                                            <td>
                                            	${t.is_late eq 1?'正常':''}
                                            	${t.is_late eq -1?'<span style="color:red;">迟到</span>':''}
                                            	${t.is_late eq 0?'未排班':''}
                                            </td> 
                                            <td>
                                            	${t.leave_early eq 1?'正常':''}
                                            	${t.leave_early eq -1?'<span style="color:red;">早退</span>':''}
                                            	${t.leave_early eq 0?'未排班':''}
                                            </td> 
                                            <td>${t.cts}</td> 
                                             
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                
                                <form method="post" action="${ctx }/clockin/mypage">
                                 <input type="hidden" name="start_ts" value="${o.start_ts }">
                                 <input type="hidden" name="end_ts" value="${o.end_ts }">
                                  <input type="hidden" name="employees_id" value="${o.employees_id }"> 
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