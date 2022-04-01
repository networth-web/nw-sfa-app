// フラッシュを表示する関数
let indicateFlash = function (flash, closeFlash) {
  // フェードイン
  flash.fadeIn();

  // クリックされたら閉じる
  closeFlash.on("click", function() {
    flash.fadeOut();
  })
  
  // 時間で閉じる
  setTimeout(function() {
    if(flash.length) {
      flash.fadeOut();
    }
  }, 5000);
}

// ページ読み込み時
$(function() {
	(function() {
    const flash = $(".flash")
		const closeFlash = $(".closeFlash");

    // フラッシュがあったら関数を実行
    if(flash.length) {
      indicateFlash(flash, closeFlash);
    }
  })();
});

// DOM変更時
$(function() {
	(function() {
    const element = $("#flash").get(0);

    // MutationObserverでDOMの変更時にコールバック関数を実行する
    var mo = new MutationObserver(function() {
      const flash = $(".flash")
      const closeFlash = $(".closeFlash");

      // フラッシュがあったら関数を実行
      if(flash.length) {
        indicateFlash(flash, closeFlash);
      }
    });

    // オブザーバーの設定
    const config = {
      // 監視の設定内容
      childList: true
    };

    // オブザーバーの実行 : 引数には対象ノードとオブザーバーの設定を渡す
    mo.observe(element, config);
  })();
});