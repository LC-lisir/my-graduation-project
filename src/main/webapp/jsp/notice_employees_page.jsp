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
                               <form class="form-inline m-t-30" action="${ctx }/notice/employees_page" method="post">
	                                <div class="form-group">
	                                    <input type="text" name="title" value="${o.title }" class="form-control"  placeholder="标题">
	                                </div>
	                                 
	                                <div class="form-group">
	                                	<button class="btn btn-success" type="submit">查找</button>
	                           		</div>
	                            </form>
                            </div>
                            <p style="color:red;">${msg }</p>
                            <div class="table-responsive">
                                    
                                    <c:forEach items="${pageInfo.list }" var="t">
                                      <div style="margin:20px 20px;border:1px dotted #333;border-radius:10px;padding: 20px 20px;">
                                      	<h3 style="text-align: center;">${t.title }</h3>
                                      	<hr>
                                      	<p>${t.context }</p>
                                      	<p style="text-align: right;">${t.cts }</p>
                                      </div>  
                                    </c:forEach>
                                     
                                
                                 <p style="color:red;">${msg }</p>
                                <form method="post" action="${ctx }/notice/employees_page">
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
	$('#seeinfo_body').html('<h1>'+t+'</h1><p>'+c+'</p>')
})
</script>
</html>