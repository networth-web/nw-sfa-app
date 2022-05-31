// 画像のアップロード
$(function() {
	(function() {
		// ファイルがセットされたらフォームを送信する
		$(document).on("input", "#image_image", function(){
			// ローダーを表示
			const $loader = $('.loader-wrap');
			$loader.show();
			
      document.imageForm.submit();
		});
  })();
});