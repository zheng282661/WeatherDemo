<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="${basePath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}/js/record/swfobject.js"></script>
<script type="text/javascript" src="${basePath}/js/record/recorder.js"></script>
<script type="text/javascript" src="${basePath}/js/record/main.js"></script>
<link rel="stylesheet" href="${basePath}/css/style.css">

</head>

<body>
	<div class="container">
		<div id="recorder-audio" class="control_panel idle">
			<button class="record_button"
				onclick="FWRecorder.record('audio', 'audio.wav');" title="Record">
				<img src="${basePath}/img/record.png" alt="Record" />
			</button>
			<button class="stop_recording_button"
				onclick="FWRecorder.stopRecording('audio');" title="Stop Recording">
				<img src="${basePath}/img/stop.png" alt="Stop Recording" />
			</button>
			<button class="play_button" onclick="FWRecorder.playBack('audio');"
				title="Play">
				<img src="${basePath}/img/play.png" alt="Play" />
			</button>
			<button class="pause_playing_button"
				onclick="FWRecorder.pausePlayBack('audio');" title="Pause Playing">
				<img src="${basePath}/img/pause.png" alt="Pause Playing" />
			</button>
			<button class="stop_playing_button"
				onclick="FWRecorder.stopPlayBack();" title="Stop Playing">
				<img src="${basePath}/img/stop.png" alt="Stop Playing" />
			</button>
			<div class="level"></div>
		</div>

		<div class="details">
			<span id="save_button"> <span id="flashcontent">
					<p>您的浏览器必须支持Javascript,而且安装了Flash播放器！</p>
			</span>
			</span> <br />
			<!-- <br />
			<button class="show_level" onclick="FWRecorder.observeLevel();">显示声波</button>
			<button class="hide_level" onclick="FWRecorder.stopObservingLevel();"
				style="display: none;">隐藏声波</button>
			<button class="show_settings" onclick="microphonePermission()">麦克风权限</button>
			<div id="status">录音状态。。。</div>
			<div>
				录音时长：<span id="duration"></span>
			</div>
			<div>
				上传状态：<span id="upload_status"></span>
			</div> -->
		</div>

		<form id="uploadForm" name="uploadForm" action="upload.php">
			<input name="authenticity_token" value="xxxxx" type="hidden">
			<input name="upload_file[parent_id]" value="1" type="hidden">
			<input name="format" value="json" type="hidden">
		</form>
	</div>

</body>
</html>