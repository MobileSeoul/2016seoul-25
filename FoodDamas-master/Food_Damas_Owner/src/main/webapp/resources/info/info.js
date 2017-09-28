/**
 * Created by Leeek on 2016-08-30.
 */
var infoManager = (function() {
	function view(u_id, callback) {
		$.getJSON('listInfo/' + u_id, callback);
	}
	// 모듈패턴, 지도같은거도 모듈패턴으로 뺴야하
	return {
		view : view
	}
})();
