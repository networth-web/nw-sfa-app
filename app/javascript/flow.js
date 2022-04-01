$(function() {
	(function() {
    const flow = $(".flow")

    // currentが最後ならクリックを無効化
    if(flow.last().hasClass("is-current")) {
      $("#salesProcessButton").prop("disabled", true);
    }

    flow.on("click", function() {
      // ボタンを有効化
      $("#salesProcessButton").prop("disabled", false);

      // activeクラスのリセット
      flow.removeClass("is-active");
      $(this).addClass("is-active");

      // クリックされた要素の番号
      const index = flow.index(this);

      // 値の指定
      // クリックされた要素がカレントなら次の値
      if($(this).hasClass("is-current")) {
        $("#lead_sales_process_id").val(index + 2);

        // もしそれが最後の要素なら無効化
        if(flow.last().hasClass("is-active")) {
          $("#salesProcessButton").prop("disabled", true);
        }

      // それ以外ならその要素のID
      } else {
        $("#lead_sales_process_id").val(index + 1);
      }

      // ボタンの表示を変更、クリックされた時それがis-currentじゃなかったら「選択されているプロセス」
      if($(this).hasClass("is-current")) {
        $("#salesProcessButton").val("プロセスを更新");
      } else {
        $("#salesProcessButton").val("プロセスを変更");
      }
    })
  })();
});


