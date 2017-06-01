$(function () {
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
				+ "<img src='./resource/image/robort.png' />" + user + "</div>"
				+ "<div class='talk_recordtextbg'>&nbsp;</div>"
				+ "<div class='talk_recordtext'>" + "<h3>" + answer + "</h3>"
				+ "<span class='talk_time'>" + myDate.toLocaleString() + "</span>"
				+ "</div>" + "</div><br/>";
		$("#chatMsg").append(charStr);
		$("#chartRoom").scrollTop = $("#chartRoom").scroll().height();
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
		$("#resultMsg").append(answer);
		$("#resultParam").append(param);
	}
	function clearAnswerAndParam() {
		$("#resultMsg").empty();
		$("#resultParam").empty();
	}
	
	function mosaicQuestion(question, user) {
		var myDate = new Date();
		charStr = "<div class='talk_recordbox'>" + "<div class='user'>"
				+ "<img src='./resource/image/me.png' />" + user + "</div>"
				+ "<div class='talk_recordtextbg'>&nbsp;</div>"
				+ "<div class='talk_recordtext'>" + "<h3>" + question + "</h3>"
				+ "<span class='talk_time'>" + myDate.toLocaleString() + "</span>"
				+ "</div>" + "</div>";
		$("#chatMsg").append(charStr);
	    $("#chartRoom").scrollTop = $("#chartRoom")[0].scrollHeight;
	}

   function get_result(data) {
        $.ajax({
			url : 'index/process.do',
			dataType : "json",
			data : {
				sentence : data
			},
			success : function(resource) {
				
				if (resource.code == 0) {
					mosaicAnswer("没有匹配的回答", "");//机器人
					clearAnswerAndParam();
				} else {
					/*var parsedJson = jQuery.parseJSON(data);*/
					mosaicAnswer(resource.data.reply, "");//机器人
					mosaicAnswerAndParam(resource.answer, resource.name, resource.preOnto);
					$("div#resultParam").html(JSON.stringify(resource.data.intent));
				}

				$('#send_btn').attr('readonly', false);
				$("#loading").css("display", "none");
				$('#chatMsg').animate({scrollTop: boxH+=200}, 800);
				
			},
			error : function() {
				//alert("error");
				$('#send_btn').attr('readonly', false);
				$("#loading").css("display", "none");
				$('#chatMsg').animate({scrollTop: boxH+=200}, 800);

			}
		});
    }

var questionTextObj = $('#send_btn');
	questionTextObj.on("keydown",function(e){ 
	    var ev = document.all ? window.event : e;
	    var questionTextValue = $(this).val();
	    if(ev.keyCode==13 && questionTextValue) {
	    	mosaicQuestion(questionTextValue, "");//刘萌
	    	get_result(questionTextValue);
	    	$(this).val("");
	    }
	})
});