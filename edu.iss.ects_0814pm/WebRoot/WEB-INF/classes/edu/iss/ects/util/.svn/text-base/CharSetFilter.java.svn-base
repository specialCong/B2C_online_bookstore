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

public class CharSetFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// 先转换参数类型
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpServletResponse res = (HttpServletResponse) arg1;

		// 设置响应内容的类型和字符编码集
		res.setContentType("text/html; charset=UTF-8");
		// 设置请求响应对象内部的字符编码
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");

		System.out.println("字符过滤了......................");

		// 过滤完毕，跳出过滤器继续执行请求
		arg2.doFilter(req, res);
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
