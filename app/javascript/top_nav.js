import jquery from "jquery"
window.$ = jquery
window.jQuery = jquery

// if ($(navPos).length) {
//   var navPos = jQuery( '#btm-nav' ).offset().bottom; // グローバルメニューの位置
// }
//   var navHeight = jQuery( '#btm-nav' ).outerHeight(); // グローバルメニューの高さ
//   jQuery( window ).on( 'scroll', function() {
//     if ( jQuery( this ).scrollBottom() > navPos ) {
// 		jQuery( 'body' ).css( 'padding-bottom', navHeight );
// 		jQuery( '#btm-nav' ).addClass( 'm_fixed' );
// 	} else {
//     jQuery( 'body' ).css( 'padding-bottom', 0 );
// 		jQuery( '#btm-nav' ).removeClass( 'm_fixed' );
// 	}
// });
// $(window).on('scroll', function () {
  //   var doch = $(document).innerHeight(); //ページ全体の高さ
  //   var winh = $(window).innerHeight(); //ウィンドウの高さ
  //   var bottom = doch - winh; //ページ全体の高さ - ウィンドウの高さ = ページの最下部位置
  //   if (bottom <= $(window).scrollTop()) {
    //   //一番下までスクロールした時に実行
    //   console.log("最底辺！");
    //   }
    // });
//スクロールした際の動きを関数でまとめる
// function PageTopAnime() {
//   var scroll = $(window).scrollTop(); //スクロール値を取得
//   var wH = window.innerHeight; //画面の高さを取得
//   var footerPos =  $('#footer').offset().top; //footerの位置を取得

//   if(scroll+wH >= (footerPos+10)) {
//     var pos = (scroll+wH) - footerPos+20 //スクロールの値＋画面の高さからfooterの位置＋10pxを引いた場所を取得し
//     $('#btm-nav').css('bottom',pos); //#page-topに上記の値をCSSのbottomに直接指定してフッター手前で止まるようにする
//   }
// }
// // 画面をスクロールをしたら動かしたい場合の記述
// $(window).on(function () {
//   PageTopAnime();/* スクロールした際の動きの関数を呼ぶ*/
// });
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