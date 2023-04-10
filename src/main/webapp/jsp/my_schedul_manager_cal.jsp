<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
      <%@ include file="common.jsp"%>
      
      <style type="text/css">
      .gfcal{padding: 20px 20px;text-align: center;}
      .gfcal .gfitem{width: 14%;float:left;border:1px dotted #dddddd;padding: 10px 5px;height: 140px;}
      </style>
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
                                
                            排班  <a href="${ctx }/schedulManager/mypage?employees_id=${o.employees_id}">历史查询</a></h4>
                              <p>默认显示当月排班信息，如需查看其他月的信息，请重新选择时间</p>
                                 <form class="form-inline m-t-30" action="${ctx }/schedulManager/mycal" method="post">
	                                   <input type="hidden" name="employees_id" value="${o.employees_id }"> 
	                                 <div class="form-group">
	                                    <input type="month" name="day" value="${o.day }" class="form-control"  placeholder="月份">
	                                </div>
	                                 
	                                <div class="form-group">
	                                	<button class="btn btn-success" type="submit">查找</button>
	                           		</div>
	                            </form>
                               
                            </div>
                            <div class="gfcal">
                            	<div class="gfitem"  style="height: 50px;">  星期日 </div>
                            	<div class="gfitem"  style="height: 50px;">  星期一 </div>
                            	<div class="gfitem"  style="height: 50px;">  星期二 </div>
                            	<div class="gfitem"  style="height: 50px;">  星期三 </div>
                            	<div class="gfitem"  style="height: 50px;">  星期四 </div>
                            	<div class="gfitem"  style="height: 50px;">  星期五 </div>
                            	<div class="gfitem"  style="height: 50px;">  星期六 </div>
                            	<c:forEach begin="1" step="1" end="${w }">
                            		<div class="gfitem"> 
                            			<h1>&nbsp;</h1>
                            			<h6>&nbsp;</h6>
                            			<p>&nbsp;</p> 
                            			<p>&nbsp;</p> 
                            		</div>
                            	</c:forEach>
                            	<c:forEach items="${ali }" var="t">
	                            	<div class="gfitem">
	                            		<h1>${t.day }</h1>
	                            		<h6>${t.obj.start_ts }-${t.obj.end_ts }</h6>
	                            		<p>${t.has=='1'?'<span style="color:green;">已排班</span>':'<span style="color:red;">未排班</span>' }
	                            		<br>
	                            		<c:if test="${role eq 'admin' and t.has=='1'}">
	                            			<a href="${ctx }/schedulManager/del?id=${t.id}&day=${o.day }">取消排班</a>
	                   					</c:if>      
	                            		
	                            		</p>
	                            		<p>
	                            		  
	                            			<c:choose>
	                            				<c:when test="${ t.note!='no' }">
	                            					<a href="javascript:alert('${t.note }');">查看备注</a>
	                            				</c:when>
	                            				<c:otherwise>
	                            					&nbsp;
	                            				</c:otherwise>
	                            			</c:choose>
	                            		
	                            		
	                            		</p>
	                            	</div>
                            	</c:forEach>
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