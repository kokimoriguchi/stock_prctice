$(document).on('turbolinks:load',function(){
    console.log("aaa")
    $("#item_item_num").change(function(){
        $("#select").submit();
    })
});