$(function() {
	(function() {
    $(document).on("input", ".action_name", function(){
      const nameInput = $(this); // input要素を定義
      const searchResult = $(this).next(); // 検索結果要素を定義

      // 検索結果の初期化
      searchResult.empty();
      searchResult.removeClass("is-active");

      // 値の取得
      const keyword = nameInput.val();

      const XHR = new XMLHttpRequest();
      const url = `/leads/:lead_id/action_models/search/?keyword=${keyword}`
      XHR.open("GET", url, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        // レスポンスの配列を取得
        const actions = XHR.response.actions;
        // 配列の中身があった場合
        if(actions.length) {
          // クラス追加
          searchResult.addClass("is-active");
          actions.forEach((action) => {
            // 要素を追加
            searchResult.append(`<div class="search-result-item">${action.name}</div>`)
          });
          // 選択された要素をセット
          $(".search-result-item").on("click", function(){
            nameInput.val($(this).text());
            $(this).remove();
          });
        }
      };
    });
  })();
});