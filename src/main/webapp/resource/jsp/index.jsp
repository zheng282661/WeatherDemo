<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();

String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<c:set var="basePath" value="<%=basePath%>" />
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${basePath}/resource/js/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${basePath}/resource/js/themes/icon.css" />
<script type="text/javascript" src="${basePath}/resource/js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}/resource/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath}/resource/js/chat_wenbo1_0929.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>



</head>
<body class="easyui-layout">
	<div region="north" split="true" border="false"
		style="overflow: hidden; height: 70px; background: url(${basePath}/resource/image/top1.jpg)">
		<span style="float: left; padding-left: 20px; padding-top: 5px"
			class="head">
			<h1></h1>
		</span>
	</div>

	<div region="south" split="true"
		style="height: 25px; background: #D2E0F2;">
		<div class="footer">
			<div align="center">copyright@Lenovo</div>
		</div>

		<%-- <%@ include file="record.jsp"%>  --%>
	</div>

    <!--左侧对话框-->
	<div region="west" split="true" data-options="collapsible:false"
		style="width: 40%;" id="west" align="center">
		<div style="padding-top: 30px;"><%@ include file="chat.jsp"%></div>
	</div>
    <!--左侧对话框-->




	<div id="mainPanle" region="center" style="width: 60%;" title="语句分析">

<!-- 		<applet code="AppletTest.class"  codebase="applet/" width="320" height="120">
		</applet> -->

		<%@ include file="show.jsp"%>

	</div>



	</div>
</body>



</html>