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
                                <h4 class="card-realname">
                                <c:if test="${o.sertype=='emp' }">
                                  护士管理
                                </c:if>
                                <c:if test="${o.sertype=='clockin' }">
                                打卡管理
			                         <a href="${ctx }/clockin/page">查询打卡历史记录信息</a>
			                    </c:if>
			                    <c:if test="${o.sertype=='sc_man' }">
			                    排班管理
			                         <a href="${ctx }/schedulManager/page">排班查询</a>
			                    </c:if>
                                
                                </h4>
                               <form class="form-inline m-t-30" action="${ctx }/employees/page" method="post">
	                                <input type="hidden" name="sertype" value="${o.sertype }">
	                                <div class="form-group">
	                                    <input type="text" name="realname" value="${o.realname }" class="form-control"  placeholder="护士姓名" >
	                                </div>
	                                <div class="form-group">
	                                    <input type="text" name="uno" value="${o.uno }" class="form-control"  placeholder="护士编号">
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
	                                	<button class="btn btn-success" type="submit">查找</button>
	                                	<c:if test="${o.sertype=='emp' }">
	                                	<a href="${ctx }/employees/toedit?sertype=${o.sertype}" class="btn btn-warning">添加</a>
	                                	</c:if>
	                                	<c:if test="${o.sertype=='sc_man' }">
					                        <a  href="${ctx }/schedulManager/toadd?sertype=${o.sertype}" class="btn btn-warning">添加排班</a>
					                    </c:if>
	                           		</div>
	                            </form>
                            </div>
                            <p style="color:red;">${msg }</p>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                           <th scope="col">编号</th>
                                            <th scope="col">姓名</th>
                                            <th scope="col">性别</th>
                                            <th scope="col">生日</th>
                                            <th scope="col">所属科室</th>
                                            <th scope="col">创建时间</th>
                                            <th scope="col">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageInfo.list }" var="t">
                                        <tr>
                                            <td>${t.uno}</td> 
                                            <td>${t.realname}</td> 
                                            <td>${t.sex}</td> 
                                            <td>${t.borth}</td> 
                                            <td>${t.dname}</td> 
                                            <td>${t.cts}</td> 
                                             <td>
                                             	<c:if test="${o.sertype=='emp' }">
			                                  	<a href="${ctx }/employees/initPwd?id=${t.id}&pageNo=${pageInfo.pageNum}&sertype=${o.sertype}" class="btn-link btn-sm">初始化密码</a>
			                                  	<a href="${ctx }/employees/toedit?id=${t.id}&pageNo=${pageInfo.pageNum}&sertype=${o.sertype}" class="btn-link btn-sm">编辑</a>
			                                  	<a href="javascript:;" data-href="${ctx }/employees/del?id=${t.id}&pageNo=${pageInfo.pageNum}&sertype=${o.sertype}" class="btn-link btn-sm del">删除</a>
			                                  	</c:if>
			                                  	<c:if test="${o.sertype=='clockin' }">
			                                  		<a href="${ctx }/clockin/mycal?employees_id=${t.id}" class="btn-link btn-sm">打卡管理</a>
			                                  	</c:if>
			                                  	<c:if test="${o.sertype=='sc_man' }">
			                                  		<a href="${ctx }/schedulManager/mycal?employees_id=${t.id}" class="btn-link btn-sm">排班管理</a>
			                                  	</c:if>
			                                  </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                 <p style="color:red;">${msg }</p>
                                <form method="post" action="${ctx }/employees/page">
                                 <input type="hidden" name="sertype" value="${o.sertype }">
                                 <input type="hidden" name="realname" value="${o.realname }">
                                 <input type="hidden" name="uno" value="${o.uno }">
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