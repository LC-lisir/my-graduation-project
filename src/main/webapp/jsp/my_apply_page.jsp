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
                                <h4 class="card-dname">我的申请</h4>
                               <form class="form-inline m-t-30" action="${ctx }/apply/mypage" method="post">
	                               
	                                 <div class="form-group">
	                                    <select  name="type"  class="form-control" >
	                                    	<option value="">--类型--</option>
	                                    	<option value="leave" <c:if test="${o.type eq 'leave'}">selected="selected"</c:if>>请假</option>
	                                    	<option value="business_trip" <c:if test="${o.type eq 'business_trip' }">selected="selected"</c:if>>出差</option>
	                                    </select>
	                                </div> 
	                                 <div class="form-group">
	                                    <select  name="is_audit"  class="form-control" >
	                                    	<option value="">--状态--</option>
	                                    	<option value="0" <c:if test="${o.is_audit eq '0'}">selected="selected"</c:if>>待审核</option>
	                                    	<option value="1" <c:if test="${o.is_audit eq '1' }">selected="selected"</c:if>>审核通过</option>
	                                    	<option value="2" <c:if test="${o.is_audit eq '2' }">selected="selected"</c:if>>审核不通过</option>
	                                    </select>
	                                </div>  
	                                <div class="form-group">
	                                	<button class="btn btn-success" type="submit">查找</button>
	                                	<a href="${ctx }/apply/toedit" class="btn btn-warning">添加</a>
	                           		</div>
	                            </form>
                            </div>
                            
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">类型</th>
                                            <th scope="col">事由</th>
                                            <th scope="col">申请时间</th>
                                            <th scope="col">状态</th>
                                            <th scope="col">审核结果</th>
                                            <th scope="col">操作</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageInfo.list }" var="t">
                                        <tr>
                                            <td>${t.type=='leave'?'请假':'出差' }</td> 
                                            <td>${t.context }<br>开始时间：${t.start_ts }<br>结束时间：${t.end_ts }</td> 
                                            <td>${t.cts }</td> 
                                            <td>
                                             <c:if test="${t.is_audit eq '0'}">待审核</c:if>
                                             <c:if test="${t.is_audit eq '1'}">审核通过</c:if>
                                             <c:if test="${t.is_audit eq '2'}">审核不通过</c:if>
                                            </td>
                                              <td><c:if test="${t.is_audit != '0'}">${t.result }<br>审核时间：${t.audit_ts}</c:if></td>
                                              <td>
                                              	<c:if test="${t.is_audit eq '0'}">
                                              		<a href="${ctx }/apply/toedit?id=${t.id}&pageNo=${pageInfo.pageNum}" class="btn-link btn-sm">编辑</a>
			                                  	    <a href="javascript:;" data-href="${ctx }/apply/del?id=${t.id}&pageNo=${pageInfo.pageNum}" class="btn-link btn-sm del">删除</a>
			                                 
                                              	
                                              	</c:if>
                                               
                                              </td> 
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                
                                <form method="post" action="${ctx }/apply/mypage">
                                 <input type="hidden" name="type" value="${o.type }">
                                 <input type="hidden" name="is_audit" value="${o.is_audit }">
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