package com.lenovo.weather.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

public class CommonTool {

	
	public static String getConfValue(String key){
		InputStream in = CommonTool.class.getResourceAsStream("/conf.properties");
		Properties perp = new Properties();
		String property = null;
		try {
			perp.load(in);
			property = perp.getProperty(key);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return property;
	}
	
	public static String getRequestIp(HttpServletRequest request){
		String ip = request.getHeader("x-forwarded-for");
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		// 手机终端
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Source-Id");
		}
		return ip;
	}
	
}
