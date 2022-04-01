// テンプレート
$(function() {
	(function() {
    $(document).on("click", ".checkbox", function(){
      const checkbox = $(".checkbox");
      const clickElement = $(this);
      const template = clickElement.prev(); // hidden要素
      const value = template.val(); // value値
      const content = $('#activity_overview'); // フォーム要素

      // チェックがついた場合
      if(clickElement.prop('checked')) {
        checkbox.prop('checked', false); // 全てのチェックを外す
        clickElement.prop('checked', true); // thisにチェックをつける
        content.val(value); // 内容をセット
      }else {
        content.val(""); // 内容を削除
      }
    });
  })();
});