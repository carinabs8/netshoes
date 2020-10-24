import videojs from "video.js/dist/video.min.js";
window.videojs = videojs;
require("./videotrack.min.js");
require("video.js/src/css/vjs.scss");

$(document).ready(function () {
	var video_ids = [];

	$.each($("video[id^='videojs-']"), function(){
		video_ids.push($(this).data("id"));
	});

	$.ajax({
		url: $("#video-options-url").data("url"),
		type: "post",
		data: {"ids": video_ids, "authenticity_token": $("#video-options-url").data("authenticy")}
	})
})