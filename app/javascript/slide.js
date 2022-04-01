// スライドフォーム
$(function() {
	(function() {
    const openSlideForm = $("#openSlideForm"); // 開くボタン
    const slideForm = $('#slideForm'); // スライドメニュー
    const closeSlide = $("#closeSlide") // 閉じるボタン

    // 開くボタンクリック時
    openSlideForm.on("click", function() {
      slideForm.removeClass('slide-out');
      slideForm.addClass('slide-in');
    });

    // 閉じるボタンクリック時
    closeSlide.on("click", function() {
      slideForm.removeClass("slide-in");
      slideForm.addClass('slide-out');
    });

  })();
});