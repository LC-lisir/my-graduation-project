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
                               <form class="form-inline m-t-30" action="${ctx }/clockin/gettj" method="post" onsubmit="return sub(this);">
	                                 
	                                 <div class="form-group">
	                                    <select  name="department_id" required="required"  class="form-control" >
	                                    	<option value="">--所属科室--</option>
	                                    	<c:forEach items="${deli }" var="t">
	                                    		<option value="${t.id }"  >${t.dname }</option>
	                                    		
	                                    	</c:forEach>
	                                    </select>
	                                </div> 
	                                <div class="form-group">
	                                    <input type="month" name="day"  required="required"   class="form-control"  placeholder="月份">
	                                </div>
	                                 <div class="form-group">
	                                    <select  name="type" id="type"  required="required"   class="form-control" >
	                                    	<option value="">--类型--</option>
	                                    	<option value="late"  >迟到</option>
	                                    	<option value="leave"  >早退</option>
	                                    		
	                                    </select>
	                                </div>   
	                                <div class="form-group">
	                                	<button class="btn btn-success" type="submit">查找</button>
	                                	 
	                           		</div>
	                            </form>
	                            
	                            <div id="container" style="width:70%; height:auto; margin: 0 auto"></div>
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

 
<script language="JavaScript">
function sub(v){ //利用ajax发送文字到reg，返回信息
	var type=$('#type').val();
	$.ajax({
		type:"post",
		url:$(v).attr('action'),
		dataType:"json",
		data:$(v).serialize(),
		success:function(data){
			var nameli=[];
			var numli=[];
			var t='';
			if(type=='late')t='迟到';
			if(type=='leave')t='早退';
			for(var i=0;i<data.length;i++){
				 var o=data[i];console.log(o)
				 nameli.push(o.realname);
				 numli.push(o.num);
			}
			console.log(nameli) 
			console.log(numli) 
			 
			 var chart = {
			      type: 'bar'
			   };
			   var title = {
			      text: t+'迟到月统计'   
			   };
			   var subtitle = {
			      text: ' '  
			   };
			   var xAxis = {
			      categories: nameli,
			      title: {
			         text: null
			      }
			   };
			   var yAxis = {
			      min: 0,
			      title: {
			         text: ' (次)',
			         align: 'high'
			      },
			      labels: {
			         overflow: 'justify'
			      }
			   };
			   var tooltip = {
			      valueSuffix: ' 次'
			   };
			   var plotOptions = {
			      bar: {
			         dataLabels: {
			            enabled: true
			         }
			      }
			   };
			   var legend = {
			      layout: 'vertical',
			      align: 'right',
			      verticalAlign: 'top',
			      x: -40,
			      y: 100,
			      floating: true,
			      borderWidth: 1,
			      backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
			      shadow: true
			   };
			   var credits = {
			      enabled: false
			   };
			   
			   var series= [{
			         name: t+'次数',
			            data: numli
			        } 
			   ];     
			      
			   var json = {};   
			   json.chart = chart; 
			   json.title = title;   
			   json.subtitle = subtitle; 
			   json.tooltip = tooltip;
			   json.xAxis = xAxis;
			   json.yAxis = yAxis;  
			   json.series = series;
			   json.plotOptions = plotOptions;
			   json.legend = legend;
			   json.credits = credits;
			   $('#container').highcharts(json);
		}
	})
	return false;
}



</script>
</html>