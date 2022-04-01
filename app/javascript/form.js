$(function() {
	(function() {
		// 閉じるボタン
		$(document).on("click", ".close-form", function(){
			$(".form-wrap").slideUp(); // フォームを閉じる
			$(".activity-card").removeClass("is-edit"); // 編集中を削除
		});

		// 閉じるボタン
		$(document).on("click", ".close-schedule-form", function(){
			$(".schedule-form-wrap").slideUp(); // フォームを閉じる
			$(".schedule-card").removeClass("is-edit"); // 編集中を削除
		});
  })();
});