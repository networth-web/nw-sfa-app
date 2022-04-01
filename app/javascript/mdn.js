// // Function to refresh input element style when necessary
var mdbInputUpdate = function () {
  document.querySelectorAll('.form-outline').forEach((formOutline) => {
    new mdb.Input(formOutline).init();
  });
  document.querySelectorAll('.form-outline').forEach((formOutline) => {
    new mdb.Input(formOutline).update();
  });
}

$(function() {
	(function() {
    const element = $('body').get(0);

    // MutationObserverでDOMの変更時にコールバック関数を実行する
    var mo = new MutationObserver(function() {
      //実行する処理
      mdbInputUpdate();
    });

    // オブザーバーの設定
    const config = {
      // 監視の設定内容が入ります。
      attributes: true,
      attributeOldValue: true,
      characterData: true,
      characterDataOldValue: true,
      childList: true,
      subtree: true
    };

    // オブザーバーの実行 : 引数には対象ノードとオブザーバーの設定を渡す
    mo.observe(element, config);
  })();
});

// Example starter JavaScript for disabling form submissions if there are invalid fields
$(function() {
	(function() {
    // needs-validationが付与されているフォームで送信ボタンが押されたら発火
    $(document).on("click", ".needs-validation input[type=submit]", function(event){
      const btn = $(this); // ボタンを定義
      let form = "" // フォームを空で定義
  
      // needs-validationクラスが付与されているフォームでクリックされた要素があるフォームを探す
      $(".needs-validation").each(function(index, element){
        if ($(element).find(btn).length) {
          form = element
        }
      });
      
      // フォームのバリデーションが引っかかったらイベントを中止しクラス付与
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();

        // トップへスクロール
        $(form).find($(".modal-body")).get(0).scrollTop = 0;
      }
      form.classList.add('was-validated');
    });
  })();
});