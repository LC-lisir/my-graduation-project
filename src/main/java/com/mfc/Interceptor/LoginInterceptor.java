package com.mfc.Interceptor;

 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
 

 
public class LoginInterceptor implements HandlerInterceptor {

	// 执行Handler方法之前执行
	// 用于身份认证、身份授权
	// 比如身份认证，如果认证通过表示当前用户没有登陆，需要此方法拦截不再向下执行
   //验证用户权限
	 
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		String url = request.getRequestURI();
		System.out.println("---------url:"+url);
		HttpSession session = request.getSession();
		/*---登陆拦截器---*/
		boolean b=true;
		/*--以下连接不需要进行拦截--*/
		String[] urls={"/tologin","/logout","/login"};
		for(String s:urls){
			if(url.indexOf(s)>-1){
				b=false;
				break;
			}
		}
		if(b){
			if(session.getAttribute("loginU")==null){
				request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
				return false; 
			}
		}
		/*---登陆拦截器---*/
		return true; 

	}
 
	// 进入Handler方法之后，返回modelAndView之前执行
	// 应用场景从modelAndView出发：将公用的模型数据(比如菜单导航)在这里
	// 传到视图，也可以在这里统一指定视图
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	// 执行Handler完成执行此方法
	// 应用场景：统一异常处理，统一日志处理
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}



	 

}