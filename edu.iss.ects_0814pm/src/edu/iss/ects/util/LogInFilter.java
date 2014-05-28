package edu.iss.ects.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.iss.ects.entity.User;

public class LogInFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		//转化请求和响应对象类型
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		
		System.out.println("非法登录过滤中.................");
		
		//得到 session  对象
		HttpSession session = request.getSession();
		
		//从 session 中取出用户对象
		User u = (User)session.getAttribute("user");
		
		//判断用户对象是否为空
		if(u == null)
		{
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

			//该用户为非法用户，跳转并提示
			request.setAttribute("message", "您输入了错误的路径，请输入用户名重新登录！！！");
			request.getRequestDispatcher(basePath+"/login.jsp").forward(request, response);
		}else
		{
			//该用户是合法用户，继续访问
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
