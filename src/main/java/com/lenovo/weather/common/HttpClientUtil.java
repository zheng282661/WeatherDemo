 package com.lenovo.weather.common;

import java.io.IOException;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.lenovo.weather.controller.IndexController;

 /**
  *
  *Module:       HttpClientUtil.java
  *Description:  以get/post的方式发送数据到指定的http接口---利用httpclient.jar包---HTTP接口的调用
  *Company:     
  *Author:       ptp
  *Date:         Feb 22, 2012
  */

 public class HttpClientUtil {
    
	 private final static Logger LOGGER = LoggerFactory
				.getLogger(IndexController.class);

     /**
      * get方式
      * @param param1
      * @param param2
      * @return
 */
     public static String getHttp(String url){
         String responseMsg = "";

         // 1.构造HttpClient的实例
         HttpClient httpClient = new HttpClient();

         // 用于测试的http接口的url

         // 2.创建GetMethod的实例
         GetMethod getMethod = new GetMethod(url);

         // 使用系统系统的默认的恢复策略
         getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
                 new DefaultHttpMethodRetryHandler());
        
         try {
             //3.执行getMethod,调用http接口
             httpClient.executeMethod(getMethod);

             //4.读取内容
             byte[] responseBody = getMethod.getResponseBody();
            
             //5.处理返回的内容
             responseMsg = new String(responseBody);
             LOGGER.info(responseMsg);
            
         } catch (HttpException e) {
        	 LOGGER.info("context", e);
         } catch (IOException e) {
        	 LOGGER.info("context", e);
         }finally{
             //6.释放连接
             getMethod.releaseConnection();
         }
         return responseMsg;
     }

     /**
      * post方式
      * @param param1
      * @param param2
      * @return
 */
     public static String postHttp(String url,Map<Serializable,Serializable> param) {
         String responseMsg = "";
         HttpClient httpClient=new HttpClient();
        
         httpClient.getParams().setContentCharset("UTF-8");
        
       
        
         PostMethod postMethod=new PostMethod(url);
         Iterator<Map.Entry<Serializable,Serializable>> it = param.entrySet().iterator();
         while (it.hasNext()) {
	          Map.Entry<Serializable,Serializable> entry = it.next();
	          postMethod.addParameter(entry.getKey().toString(), entry.getValue().toString());
         }
        try {
             httpClient.executeMethod(postMethod);//200
             responseMsg = postMethod.getResponseBodyAsString().trim();
             LOGGER.info(responseMsg);
         } catch (HttpException e) {
        	 LOGGER.info("context", e);
         } catch (IOException e) {
        	 LOGGER.info("context", e);
         } finally {
             //7.释放连接
             postMethod.releaseConnection();
         }
         return responseMsg;
     }
public static void main(String[] args) throws UnsupportedEncodingException {
	String sentence = URLEncoder.encode("北京天气","UTF-8");
	String url = "http://10.100.213.222:15000/?sentence="+sentence+"&userid=10.100.206.35";
	System.out.println(getHttp(url));
}
 }