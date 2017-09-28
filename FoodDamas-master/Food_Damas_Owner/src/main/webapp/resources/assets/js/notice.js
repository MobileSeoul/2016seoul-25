var NoticeManager = function() {

	function NoticeList(page, callback) {

		var noticejson = $.getJSON('http://localhost/notice'+ "?" +page, callback);

	
	}

	return {

		NoticeList : NoticeList
	}

}();// 즉시실행
