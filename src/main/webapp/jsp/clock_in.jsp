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
                                <h4 class="card-title" style="text-align: center;">上下班请记得打卡哦</h4>
                         
                            </div>
                           
                            <div class="container" style="text-align: center;">
                                   <audio id="yinpin" style="display:none;" src="" controls="controls"></audio>
                                      	<span id="clockin" class="mdi mdi-cloud-print" style="font-size: 10em"></span>   
                                      	<p>请点击打卡机进行签到哦</p>            
                                      	<p style="color:red;" id="tip"></p>            
                                
                                 
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
 
var audio=document.getElementById("yinpin");
$('#clockin').click(function(){
	$.ajax({
	    url: '${ctx}/clockin/add',
		type: 'post',
		data: {},
		dataType: 'json',
		success:function(data){
			if(data.status==1){
				//打卡成功
				$('#tip').text(data.msg).css('color','green');
				$('#yinpin').attr('src','${ctxf }/assets/audio/dakasucc.mp3');
				audio.play();
				 
			}else if(data.status==11){
				//迟到
				$('#tip').text(data.msg).css('color','green');
				$('#yinpin').attr('src','${ctxf }/assets/audio/chidao.mp3');
				audio.play();
				 
			}else if(data.status==12){
				//早退
				$('#tip').text(data.msg).css('color','green');
				$('#yinpin').attr('src','${ctxf }/assets/audio/yizaotui.mp3');
				audio.play();
				  
			}else if(data.status==-2){
				//重复打卡
				$('#tip').text(data.msg).css('color','green');
				$('#yinpin').attr('src','${ctxf }/assets/audio/yidaka.mp3');
				audio.play();
				 
			}else{
				 alert(data.msg);
					window.location.reload();
					 
			}
		}
	})
})
</script>
</html>