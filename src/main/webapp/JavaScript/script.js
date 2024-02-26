$(function(){
    $('.page-top').click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 500);
        return false;
    });
});

$(window).on('load scroll', function(){
    if($(this).scrollTop() > 1) {
        $('.page-top').addClass('show');
    }else{
        $('.page-top').removeClass('show');
    }
});