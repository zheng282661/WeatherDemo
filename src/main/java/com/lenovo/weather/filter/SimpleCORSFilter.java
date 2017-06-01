package com.lenovo.weather.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import com.lenovo.weather.common.CommonTool;

/**
 * 
 *通过CORS解决服务器跨域的问题
 * 
 * @author Wang Yimin
 * @since 2015/12/1 初版
 */
public class SimpleCORSFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {

		HttpServletResponse response = (HttpServletResponse) res;
		response.setHeader("Access-Control-Allow-Origin", CommonTool.getConfValue("client_origin"));
		response.setHeader("Access-Control-Allow-Methods",
				"POST, GET, OPTIONS");
		response.setHeader("Access-Control-Max-Age", "3600");
		response.setHeader("Access-Control-Allow-Headers", "x-requested-with,content-type");
		response.setHeader("Access-Control-Allow-Credentials", "true");
		
		chain.doFilter(req, res);
	}

	public void init(FilterConfig arg0) throws ServletException {

	}
}
