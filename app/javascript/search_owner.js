$(function() {
	(function() {
		// 値が変わったらフォームを送信
    $(document).on("change", "#searchOwner", function(){
      // ローダーを表示
			const $loader = $('.loader-wrap');
			$loader.show();
      // ボタンを定義
      const submitButton = $("#searchOwnerSubmit");
      submitButton.click();
    });
  })();
});

$(function() {
	(function() {
		// 値が変わったらフォームを送信
    $(document).on("change", "#searchMeetingType", function(){
      // ローダーを表示
			const $loader = $('.loader-wrap');
			$loader.show();
      // ボタンを定義
      const submitButton = $("#searchMeetingTypeSubmit");
      submitButton.click();
    });
  })();
});