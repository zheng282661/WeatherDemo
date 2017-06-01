package com.lenovo.weather.component;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.lenovo.weather.common.HttpClientUtil;

@Component
public class ProcessComponent {

	private final Logger LOGGER = LoggerFactory
			.getLogger(ProcessComponent.class);

	public JSONObject process(String sentence, String req_ip) throws UnsupportedEncodingException {
		JSONObject jo= new JSONObject();
		if(null != sentence && null != req_ip){
			sentence = URLEncoder.encode(sentence, "UTF-8");
			String url = "http://10.100.217.233:15000/?sentence="+sentence+"&userid="+req_ip;
			LOGGER.info("http请求url："+url);
			String response = HttpClientUtil.getHttp(url);
			LOGGER.info("http响应数据："+response);
			if(null != response){
				jo.put("data", JSONObject.fromObject(response));
				if("null".equals(((JSONObject)jo.get("data")).get("reply").toString())){
					jo.put("code", 0);
					jo.put("data", null);
				}else{
					jo.put("code", 1);
				}
			}
		}
		return jo;
	}

}
