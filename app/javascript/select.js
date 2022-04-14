// 出席セレクトボックス
$(function() {
	(function() {
    // 値が変わったらフォームを送信
    $(document).on("change", ".attend-select", function(){
      // IDを定義
      const id = $(this).data("attend-select");
      // フォームを定義
      const form = $(`[data-attend-form=${id}]`);
      // ボタンを定義
      const submitButton = form.find('input[name="commit"]');
      submitButton.click();
    });
  })();
});

// 承認セレクトボックス
$(function() {
	(function() {
    // 値が変わったらフォームを送信
    $(document).on("change", ".approval-select", function(){
      // 値を定義
      const val = $(this).val();

      // IDを定義
      const id = $(this).data("approval-select");

      // フォームを定義
      const form = $(`[data-approval-form=${id}]`);

      // 不承認の場合
      if(val == 2) {
        // モーダルを開くリンクをクリック
        const link = $(`[data-approval-link=${id}]`);
        link[0].click();

        // ボタンを閉じたら値をもとに戻す
        $(document).on("click", ".cancel-form", function(){
          console.log("閉じる");
          form[0].reset();
        });
        // ボタンを閉じたら値をもとに戻す
        $(document).on("click", ".btn-close", function(){
          console.log("閉じる");
          form[0].reset();
        });

      // 不承認以外の場合
      } else {
        // ボタンを定義して送信
        const submitButton = form.find('input[name="commit"]');
        submitButton.click();
      }
    });
  })();
});

// select2
$(document).ready(function() {
  $('#hide_lead_id').select2();
});