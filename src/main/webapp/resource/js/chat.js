var charStr = "";// 聊天字符串
// 网易云音乐播放插件 前后的url字符串
var musicPre = "<iframe frameborder='no' border='0' marginwidth='0' marginheight='0'"
		+ "width=330 height=86 src='http://music.163.com/outchain/player?type=2&id=";
var musicAfter = "&auto=1&height=66'></iframe></div>";

var ifPermission = false;

$(function() {
	// buildMusicAnswer(287035);
});

/**
 * 组合聊天中的提问的页面代码
 * 
 * @param question
 * @param user
 */
function mosaicQuestion(question, user) {
	var myDate = new Date();
	charStr = "<div class='talk_recordbox'>" + "<div class='user'>"
			+ "<img src='./img/me.png' />" + user + "</div>"
			+ "<div class='talk_recordtextbg'>&nbsp;</div>"
			+ "<div class='talk_recordtext'>" + "<h3>" + question + "</h3>"
			+ "<span class='talk_time'>" + myDate.toLocaleString() + "</span>"
			+ "</div>" + "</div>";
	$("#chatMsg").append(charStr);
    $("#chartRoom").scrollTop = $("#chartRoom")[0].scrollHeight;
}

/**
 * 组合聊天中的回答页面代码
 * 
 * @param question
 * @param user
 */
var boxH = 0;
function mosaicAnswer(answer, user) {
	var myDate = new Date();
	charStr = "<div class='talk_recordboxme'>" + "<div class='user'>"
			+ "<img src='./img/robort.png' />" + user + "</div>"
			+ "<div class='talk_recordtextbg'>&nbsp;</div>"
			+ "<div class='talk_recordtext'>" + "<h3>" + answer + "</h3>"
			+ "<span class='talk_time'>" + myDate.toLocaleString() + "</span>"
			+ "</div>" + "</div><br/>";
	$("#chatMsg").append(charStr);
	$("#chartRoom").scrollTop = $("#chartRoom")[0].scrollHeight;
}

/**
 * 组合天气回复的答案和参数
 * 
 * @param answer
 * @param name
 * @param param
 */
function mosaicAnswerAndParam(answer, name, param) {
	clearAnswerAndParam();
	//$("#resultMsg").append(answer);
	$("#resultParam").append(param);
}

/**
 * 清理所有的回答和参数
 */
function clearAnswerAndParam() {
	$("#resultMsg").empty();
	$("#resultParam").empty();
}

/**
 * 组合音乐回复列表
 */
function buildMusicAnswer(id) {
	clearAnswerAndParam();
	if (id != 'null') {
		$("#resultMsg").append(musicPre + id + musicAfter);
	}

	var musicList = "<br/><table class='easyui-datagrid'>"
			+ "<tr><td><a href='#' onclick='buildMusicAnswer(287035)'>遇见-孙燕姿</a></td></tr>"
			+ "<tr><td><a href='#' onclick='buildMusicAnswer(5376504)'>Gee - 少女时代</a></td></tr>"
			+ "<tr><td><a href='#' onclick='buildMusicAnswer(287031)'>隐形人 - 孙燕姿</a></td></tr>"
			+ "<tr><td><a href='#' onclick='buildMusicAnswer(327068)'>记得 - 张惠妹</a></td></tr>"
			+ "</table>";
	$("#resultMsg").append(musicList);

}
function send() {
	var questionText = $('#questionText').val();
	if (questionText == "") {
		return;
	} else {


		$('#questionText').val("");
		$('#questionText').attr('readonly', true);

		mosaicQuestion(questionText, "");//刘萌
		$("#loading").css("display", "block");

		$("#chartRoom").scrollTop(450);
		
		// ajax 数据传入后台 处理
		$.ajax({
			url : 'askAndAnswer',
			cache : false,
			dataType : "json",
			data : {
				question : questionText,
			},
			success : function(data) {

				if (data.ifMatch == "false") {
					mosaicAnswer("没有匹配的回答", "");//机器人
					clearAnswerAndParam();
				} else {
					/* var parsedJson = jQuery.parseJSON(data); */
					mosaicAnswer(data.currentReply, "");//机器人
					mosaicAnswerAndParam(data.answer, data.name, data.preOnto);
				}
				$('#questionText').attr('readonly', false);
				$("#loading").css("display", "none");
				$('#chatMsg').animate({scrollTop: boxH+=200}, 800);
				//$("#chartRoom").scrollTop(450);
			},
			error : function() {
				//alert("error");
				$('#questionText').attr('readonly', false);
				$("#loading").css("display", "none");
				$('#chatMsg').animate({scrollTop: boxH+=200}, 800);
				
			}
		});

		/*
		 * $('#resultParam').panel('open').panel('refresh');
		 * $('#result').panel('open').panel('refresh');
		 */

	}
}

/**
 * 录音的录制和上传
 */
var mediaConstraints = {
	audio : true
};

var fileType = 'audio'; // or "audio"
var fileName = 'ABCDEF.wav'; // or "wav" or "ogg"

var myblob;
var mediaRecorder;

function onMediaSuccess(stream) {
	mediaRecorder = new MediaStreamRecorder(stream);
	mediaRecorder.mimeType = 'audio/wav'; // check this line for audio/wav
	mediaRecorder.ondataavailable = function(blob) {
		// POST/PUT "Blob" using FormData/XHR2
		/* var blobURL = URL.createObjectURL(blob);
		document.write('<a href="' + blobURL + '">' + blobURL + '</a>'); */
		myblob = blob;
	};
	mediaRecorder.start(300000);
}

function onMediaError(e) {
	console.error('media error', e);
}

function record() {
	navigator.getUserMedia(mediaConstraints, onMediaSuccess, onMediaError);
	$('#questionText').attr('readonly', true);
	$('#questionText').val("正在录音...");
	$("#recordBtn").val("松开发送");

}

function sendrecord() {
	$("#recordBtn").val("按下录音");
	mediaRecorder.stop();
	$('#questionText').val("正在识别...");
	upload();
	$('#questionText').attr('readonly', false);
}

function upload() {
	var url = "./record/uploadFile";
	var formData = new FormData();
	formData.append("file", myblob);

	xhr(url, formData, function(text) {
		$('#questionText').val(text);
	});
}

function xhr(url, data, callback) {
	var request = new XMLHttpRequest();
	request.onreadystatechange = function() {
		if (request.readyState == 4 && request.status == 200) {
			callback(request.responseText);
		}
	};
	request.open('POST', url);
	request.send(data);
}
