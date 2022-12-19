//= require sweetalert2
$(window).on('load', function(){
    if ($('p').hasClass('modal-notice')) {
        Swal.fire(
            '',
            $('.modal-notice').text(),
            'success'
        )
    } else if ($('p').hasClass('modal-alert')) {
        Swal.fire(
            '',
            $('.modal-alert').text(),
            'warning'
        )
    }
    if ($('#textSearch').val()) {
        codeAddress();
    }
})

$("#dangerous_spot_address").on('change',function(){
     $('#textSearch').val($('#dangerous_spot_address').val());
});
