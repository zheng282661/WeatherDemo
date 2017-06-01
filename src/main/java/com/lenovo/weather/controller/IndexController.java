package com.lenovo.weather.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lenovo.weather.common.CommonTool;
import com.lenovo.weather.component.ProcessComponent;

@Controller
@RequestMapping("/index")
public class IndexController {

	private final Logger LOGGER = LoggerFactory
			.getLogger(IndexController.class);

	@Resource
	private ProcessComponent processComponent;
	
	@RequestMapping("/process")
	@ResponseBody
	public JSONObject postAudio(HttpServletRequest request,@RequestParam(value="sentence") String sentence) throws Exception{
		LOGGER.info("/index/process.do=======param>sentence="+sentence);
		String req_ip = CommonTool.getRequestIp(request);
		return processComponent.process(sentence,req_ip);
	}

}
