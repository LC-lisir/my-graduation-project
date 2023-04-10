<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:if test="${empty loginU }">

<script>
alert('请登录账号');
window.location="${ctx}/tologin";

</script>

</c:if>
 <header class="topbar" data-navbarbg="skin6"  style="position: fixed;width:100%;">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <div class="navbar-header" data-logobg="skin5">
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)">
                        <i class="ti-menu ti-close"></i>
                    </a>
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-brand">
                        <a href="javscript:;" class="logo">
                            
                            
                            <span class="logo-text">
                                医护排班系统
                            </span>
                        </a>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Toggle which is visible on mobile only -->
                    <!-- ============================================================== -->
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="ti-more"></i>
                    </a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin6">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-left mr-auto">
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <li class="nav-item search-box">
                             <a href="#" target="_blank"></a>
                        </li>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-right">
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">你好，<c:if test="${role eq 'admin' }">${loginU.uname }</c:if><c:if test="${role eq 'employees' }">${loginU.realname }</c:if></a>
                            <div class="dropdown-menu dropdown-menu-right user-dd animated">
                                <c:if test="${role eq 'admin' }">
                                <a class="dropdown-item" href="${ctx }/admin/to_updatePwd"><i class="mdi mdi-key-change"></i> 修改密码</a>
                              
                           		</c:if>
                           		<c:if test="${role eq 'employees' }">
                                <a class="dropdown-item" href="${ctx }/employees/to_updatePwd"><i class="mdi mdi-key-change"></i> 修改密码</a>
                           		</c:if>
                           		  <a class="dropdown-item" href="${ctx }/logout"><i class="mdi mdi-power"></i> 退出账号</a>
                            </div>
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar" data-sidebarbg="skin5" style="position: fixed;">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                	 <ul id="sidebarnav">
                	<c:if test="${role eq 'admin' }">
                   
                   
                        <li class="sidebar-item">
                            <a href="${ctx }/department/page"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi  mdi-codepen"></i>
                                <span class="hide-menu">科室管理</span>
                            </a>
                        </li>
                         <li class="sidebar-item">
                            <a href="${ctx }/employees/page?sertype=emp"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-account-box"></i>
                                <span class="hide-menu">护士管理</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="${ctx }/employees/page?sertype=clockin"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-calendar-clock"></i>
                                <span class="hide-menu">打卡管理</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="${ctx }/clockin/tj"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-database"></i>
                                <span class="hide-menu">打卡统计</span>
                            </a>
                        </li>
                         <li class="sidebar-item">
                            <a href="${ctx }/schedul/page"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-content-save-settings"></i>
                                <span class="hide-menu">排班设置</span>
                            </a>
                        </li>
                         <li class="sidebar-item">
                            <a href="${ctx }/employees/page?sertype=sc_man"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-library"></i>
                                <span class="hide-menu">排班安排</span>
                            </a>
                        </li>
                         <li class="sidebar-item">
                            <a href="${ctx }/apply/page"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-code-not-equal-variant"></i>
                                <span class="hide-menu">请假/出差审批</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="${ctx }/notice/page"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-note-multiple"></i>
                                <span class="hide-menu">公告管理</span>
                            </a>
                        </li>
                         <li class="sidebar-item">
                            <a href="${ctx }/admin/to_updatePwd"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-key-change" ></i>
                                <span class="hide-menu">修改密码</span>
                            </a>
                        </li> 
                        
               
                    </c:if>
                   
                    
                    <c:if test="${role eq 'employees' }">
                     
                   		 <li class="sidebar-item">
                            <a href="${ctx }/clockin/toadd"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-calendar-clock"></i>
                                <span class="hide-menu">我要打卡</span>
                            </a>
                        </li>
                         <li class="sidebar-item">
                            <a href="${ctx }/clockin/mycal"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-calendar-clock"></i>
                                <span class="hide-menu">查看打卡信息</span>
                            </a>
                        </li>
                         <li class="sidebar-item">
                            <a href="${ctx }/apply/toedit"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-anchor"></i>
                                <span class="hide-menu">出差/请假申请</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="${ctx }/apply/mypage"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-code-not-equal-variant"></i>
                                <span class="hide-menu">我的申请</span>
                            </a>
                        </li>
                         <li class="sidebar-item">
                            <a href="${ctx }/schedulManager/mycal"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-library"></i>
                                <span class="hide-menu">我的排班</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="${ctx }/notice/employees_page"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-note-multiple"></i>
                                <span class="hide-menu">查看公告</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="${ctx }/employees/info"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-account-box"></i>
                                <span class="hide-menu">查看基本信息</span>
                            </a>
                        </li>
                         <li class="sidebar-item">
                            <a href="${ctx }/employees/to_updatePwd"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-key-change"></i>
                                <span class="hide-menu">修改密码</span>
                            </a>
                        </li> 
                        
                        
                        </c:if>
                        
                        
                         <li class="sidebar-item">
                            <a href="${ctx }/logout"  class="sidebar-link waves-effect waves-dark sidebar-link" aria-expanded="false">
                                <i class="mdi mdi-power" ></i>
                                <span class="hide-menu">退出系统</span>
                            </a>
                        </li> 
                    </ul>
                   
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <div style="height: 60px;">   </div>
        
        