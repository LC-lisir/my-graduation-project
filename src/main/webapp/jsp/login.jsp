<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		  <%@ include file="common.jsp"%>
	</head>
	<body style="background: #233242;background-image: url('${ctxf}/assets/images/back.jpg');background-size:100% 100%;">
		
		<div class="card" style="margin:10% auto;width:450px;opacity:0.95;">
                            <div class="card-body">
                                <form method="post" action="${ctx }/login" class="form-horizontal form-material" >
                                	<h2 style="text-align: center;">医院护士的员工排班系统</h2>
                                	<br>
                                    <div class="form-group">
                                        <label class="col-md-12">用户名：</label>
                                        <div class="col-md-12">
                                            <input type="text" name="uname" required="required" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="example-email" class="col-md-12">密码：</label>
                                        <div class="col-md-12">
                                            <input type="password" name="upass" required="required"  class="form-control form-control-line" name="example-email">
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label for="example-email" class="col-md-12">角色：</label>
                                        <div class="col-md-12">
                                            <select name="role" class="form-control form-control-line">
                                            	<option value="admin">管理员</option>
                                            	<option value="employees"> 护士</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12" style="text-align: center;">
                                        	<p style="color:red;">${msg }</p>
                                            <button class="btn btn-success">&nbsp;&nbsp;&nbsp;登录&nbsp;&nbsp;&nbsp;</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
	</body>
	
	
<script type="text/javascript">


</script>	 
    
</html>
