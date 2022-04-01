// $(function() {
// 	(function() {
//     const leadIdElement = $("#memo_lead_id"); // リードID要素
//     if (leadIdElement.length){
//       const textareaElement = $("#lead_memo"); // テキストエリア要素
//       const LeadId = leadIdElement.text(); // リードID
//       textareaElement.on('input', function() {
//         const text = textareaElement.val(); // テキスト内容
//         var params = "memo=" + text;
//         const XHR = new XMLHttpRequest();
//         XHR.open("GET", `/leads/${LeadId}/update_memo?` + encodeURI(params), true);
//         XHR.responseType = "json";
//         XHR.send();
//         XHR.onload = () => {
//           console.log("非同期通信成功");
//         };
//       });
//     };
//   })();
// });