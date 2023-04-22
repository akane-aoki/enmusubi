import jquery from "jquery"
window.$ = jquery
window.jQuery = jquery

jQuery(function() {

  var footer = $('.footer').innerHeight(); // footerの高さを取得
  
  window.onscroll = function () {
    var point = window.pageYOffset; // 現在のスクロール地点 
    var docHeight = $(document).height(); // ドキュメントの高さ
    var dispHeight = $(window).height(); // 表示領域の高さ
  
    if(point > docHeight-dispHeight-footer){ // スクロール地点>ドキュメントの高さ-表示領域-footerの高さ
      $('.page-top').addClass('is-hidden'); //footerより下にスクロールしたらis-hiddenを追加
    }else{
      $('.page-top').removeClass('is-hidden'); //footerより上にスクロールしたらis-hiddenを削除
    }
  };
});