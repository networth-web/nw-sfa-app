// メニューのアクティブ
$(function() {
	(function() {
    // 今のページを判定
    const path = location.pathname;

    if(path == "/") {
      $("#rootMenu").addClass("is-active")

    } else if (path.indexOf('/leads') != -1) {
      $("#leadsMenu").addClass("is-active")

    } else if (path.indexOf('/all_meetings') != -1) {
      $("#meetingsMenu").addClass("is-active")

    } else if (path.indexOf('/my_meetings') != -1) {
      $("#meetingsMenu").addClass("is-active")

    } else if (path.indexOf('/all_orders') != -1) {
      $("#ordersMenu").addClass("is-active")

    } else if (path.indexOf('/my_orders') != -1) {
      $("#ordersMenu").addClass("is-active")

    } else if (path.indexOf('/schedules') != -1) {
      $("#schedulesMenu").addClass("is-active")

    } else if (path.indexOf('/seminars') != -1) {
      $("#seminarsMenu").addClass("is-active")

    } else if (path.indexOf('/sources') != -1) {
      $("#sourcesMenu").addClass("is-active")

    } else if (path.indexOf('/sales_processes') != -1) {
      $("#salesProcessesMenu").addClass("is-active")

    } else if (path.indexOf('/properties') != -1) {
      $("#propertiesMenu").addClass("is-active")

    } else if (path.indexOf('/losts') != -1) {
      $("#lostsMenu").addClass("is-active")

    } else if (path.indexOf('/users') != -1) {
      $("#usersMenu").addClass("is-active")

    } else if (path.indexOf('/template_models') != -1) {
      $("#templateModelsMenu").addClass("is-active")

    } else if (path.indexOf('/hides') != -1) {
      $("#hidesMenu").addClass("is-active")
    }
  })();
});