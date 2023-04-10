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
                                <h4 class="card-title">公告管理</h4>
                               <form class="form-inline m-t-30" action="${ctx }/notice/page" method="post">
	                                <div class="form-group">
	                                    <input type="text" name="title" value="${o.title }" class="form-control"  placeholder="标题">
	                                </div>
	                                 
	                                <div class="form-group">
	                                	<button class="btn btn-success" type="submit">查找</button>
	                                	<a href="${ctx }/notice/toedit" class="btn btn-warning">添加</a>
	                           		</div>
	                            </form>
                            </div>
                            <p style="color:red;">${msg }</p>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">标题</th>
                                            <th scope="col">创建时间</th>
                                            <th scope="col">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageInfo.list }" var="t">
                                        <tr>
                                            <td>${t.title}</td> 
                                            <td>${t.cts}</td> 
                                             <td>
                                             	
			                                  	<a href="javascript:;" class="btn-link btn-sm seeinfo" data-c="${t.context }" data-t="${t.title }">查看</a>
			                                  	<a href="${ctx }/notice/toedit?id=${t.id}&pageNo=${pageInfo.pageNum}" class="btn-link btn-sm">编辑</a>
			                                  	<a href="javascript:;" data-href="${ctx }/notice/del?id=${t.id}&pageNo=${pageInfo.pageNum}" class="btn-link btn-sm del">删除</a>
			                                  </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                 <p style="color:red;">${msg }</p>
                                <form method="post" action="${ctx }/notice/page">
                                 <input type="hidden" name="title" value="${o.title }">
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

<!-- 模态框（Modal） -->
<div class="modal fade" id="seeinfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
					查看详情
				</h4>
			</div>
			<div class="modal-body" id="seeinfo_body">
				 
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				 
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<script type="text/javascript">

$('.del').click(function(){
	if(confirm('确定删除？'))window.location=$(this).attr('data-href');
})

$('.seeinfo').click(function(){
	var t=$(this).attr('data-t');
	var c=$(this).attr('data-c');
	$('#seeinfo').modal('show');
	$('#seeinfo_body').html('<h3>'+t+'</h3><p>'+c+'</p>')
})
</script>
</html>