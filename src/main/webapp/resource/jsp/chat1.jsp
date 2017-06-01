<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
/*讨论区*/
.jp-container .talk_recordbox {
	min-height: 80px;
	color: #afafaf;
	padding-top: 5px;
	padding-right: 10px;
	padding-left: 10px;
	padding-bottom: 0px;
}

.jp-container .talk_recordbox:first-child {
	border-top: none;
}

.jp-container .talk_recordbox:last-child {
	border-bottom: none;
}

.jp-container .talk_recordbox .talk_recordtextbg {
	float: left;
	width: 10px;
	height: 30px;
	display: block;
	background-image: url(${basePath}/img/talk_recordtext.png);
	background-repeat: no-repeat;
	background-position: left top;
}

.jp-container .talk_recordbox .talk_recordtext {
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	background-color: #b8d45c;
	width: 240px;
	height: auto;
	display: block;
	padding: 5px;
	float: left;
	color: #333333;
}

.jp-container .talk_recordbox h3 {
	font-size: 14px;
	padding: 2px 0 5px 0;
	text-transform: uppercase;
	font-weight: 100;
}

.jp-container .talk_recordbox .user {
	float: left;
	display: inline;
	height: 45px;
	width: 45px;
	margin-top: 0px;
	margin-right: 5px;
	margin-bottom: 0px;
	margin-left: 0px;
	font-size: 12px;
	line-height: 20px;
	text-align: center;
}

/*自己发言样式*/
.jp-container .talk_recordboxme {
	display: block;
	min-height: 80px;
	color: #afafaf;
	padding-top: 5px;
	padding-right: 10px;
	padding-left: 10px;
	padding-bottom: 0px;
}

.jp-container .talk_recordboxme .talk_recordtextbg {
	float: right;
	width: 10px;
	height: 30px;
	display: block;
	background-image: url(${basePath}/img/talk_recordtext_2.png);
	background-repeat: no-repeat;
	background-position: left top;
	background-repeat: no-repeat;
}

.jp-container .talk_recordboxme .talk_recordtext {
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	background-color: #b8d45c;
	width: 240px;
	height: auto;
	padding: 5px;
	color: #666;
	font-size: 12px;
	float: right;
}

.jp-container .talk_recordboxme h3 {
	font-size: 14px;
	padding: 2px 0 5px 0;
	text-transform: uppercase;
	font-weight: 100;
	color: #333333;
}

.jp-container .talk_recordboxme .user {
	float: right;
	height: 45px;
	width: 45px;
	margin-top: 0px;
	margin-right: 10px;
	margin-bottom: 0px;
	margin-left: 5px;
	font-size: 12px;
	line-height: 20px;
	text-align: center;
	display: inline;
}

.talk_time {
	color: #666;
	text-align: right;
	width: 240px;
	display: block;
}
</style>



<title></title>


<script type="text/javascript" src="${basePath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}/js/chat.js"></script>
<script type="text/javascript"
	src="${basePath}/js/MediaStreamRecorder.js"></script>
</head>

<body>
	<!--聊天窗口-->

	<div id="chartRoom" class="easyui-panel" title="聊天"
		style="padding: 10px; width: 410px;"
		data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">

		<table border="0">

			<!--聊天记录窗口-->

			<tr align="right">

				<td><div id="chartRoom" class="easyui-panel"
						style="padding: 5px; width: 380px; height: 380px;"
						data-options="closable:false,collapsible:false,minimizable:false,maximizable:false">

						<div class="jp-container">
							<div id="chatMsg"></div>

							<div class="talk_recordboxme" id="loading" style="display: none">
								<div class="user">
									<img src="./img/robort.png" />机器人
								</div>
								<div class="talk_recordtextbg">&nbsp;</div>
								<div class="talk_recordtext">
									I am thinking..<img
										src="${basePath}/js/themes/bootstrap/images/loading.gif" /> <span
										class="talk_time">waiting...</span>
								</div>
							</div>
							<br />

						</div>
					</div></td>
				<!-- <td><a id="msg_end" style="height: 0px; overflow: hidden"  name="1" href="#1"></a></td> -->

			</tr>



			<!--发送记录窗口-->

			<tr align="right">

				<td><div id="chartRoom" class="easyui-panel"
						style="padding: 5px; width: 380px;"closable:false,collapsible:false,minimizable:false,maximizable:false">
						<div id="recorder-audio" class="control_panel idle"
							style="display: none;">
							<div class="level"></div>
						</div>
						<input type="text"
							onkeypress="if(event.keyCode==13) {send();return false;}"
							style="width: 270px" id="questionText"></input> &nbsp;<!-- <input
							type="button" id="recordBtn" onmousedown="record()"
							onmouseup="sendrecord()" value="按下录音" /> -->
					</div></td>

			</tr>


		</table>


	</div>
</body>

</html>