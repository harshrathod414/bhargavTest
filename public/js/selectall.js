
$("#selectall").click(function () {
    if (this.checked) {
        $('.checkboxall').each(function () {
            $(".checkboxall").prop('checked', true);
        })
    } else {
        $('.checkboxall').each(function () {
            $(".checkboxall").prop('checked', false);
        })
    }
});

$(".checkboxall").change(function () {
    var array = $('tbody input:checked');
    console.log(array.length);
    if (array.length == 0) {
        $("#selectall").prop('checked', false);
    }
});