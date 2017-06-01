package com.lenovo.weather.vo;

import java.io.Serializable;
import java.util.Map;

public class ResponseModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7270365802060476881L;
	
	public static Integer ERROR_CODE=0;
	
	public static Integer SUCCESS_CODE=1;
	
	private Integer code;
	
	private String message;
	
	private Map<String, Serializable> data;
	

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, Serializable> getData() {
		return data;
	}

	public void setData(Map<String, Serializable> data) {
		this.data = data;
	}

	
	
}
