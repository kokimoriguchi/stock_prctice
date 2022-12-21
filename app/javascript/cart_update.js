$(document).ready(function(){
    $(this).click(function() {
        var v = $('select').val();
        console.log(v);
    })
});
$('.cart_update').change(function() {
    $(this).parent().submit();
    console.log("aaa");//ここのスクリプトタグ中をjsのファイルにぶち込んで発火機能つける
    var val = $('.cart_update').val();
    console.log(val);
  });