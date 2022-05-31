// 活動のトグル
$(function() {
	(function() {
    $(document).on("click", ".toggle-icon", function(){
      const index = $(this).data("toggle-icon");
      const elem = $(`[data-toggle-content=${index}]`);

      // コンテンツがオープンかどうかで条件分岐
      // オープンがなかったらアイコンを↓方向にして、コンテンツを表示
      if(!$(this).hasClass("is-open")) {
        elem.slideDown(200);
        $(this).addClass("is-open");
      } else {
        elem.slideUp(200);
        $(this).removeClass("is-open");
      }
    });
  })();
});

// 予定のトグル
$(function() {
	(function() {
    $(document).on("click", ".schedule-toggle-icon", function(){
      const index = $(this).data("schedule-toggle-icon");
      const elem = $(`[data-schedule-toggle-content=${index}]`);

      // コンテンツがオープンかどうかで条件分岐
      // オープンがなかったらアイコンを↓方向にして、コンテンツを表示
      if(!$(this).hasClass("is-open")) {
        elem.slideDown(200);
        $(this).addClass("is-open");
      } else {
        elem.slideUp(200);
        $(this).removeClass("is-open");
      }
    });
  })();
});