$(document).on('turbolinks:load', function () {
    $('select').material_select();

    $('.collapsible').collapsible();

    $('.datepicker').pickadate({
        firstDay: 1,
        selectMonths: true,
        selectYears: true
    });

    initPickdate();

    $('#selectDay').change(function () {
        var datepicker = $('.datepicker');
        var selected = $(this).prop('selectedIndex');
        var picker = datepicker.pickadate('picker');

        if (selected !== "undefined" && selected !== 0) {
            var array = [];
            for (var i = 0; i < 8; ++i) {
                if (i !== selected)
                    array.push(i);
            }
            datepicker.prop("disabled", false);
            picker.clear();
            picker.set('enable', true);
            picker.set('disable', array);
        } else {
            picker.clear();
            datepicker.prop("disabled", true);
        }

    })
});

function initPickdate() {
    var datepicker = $('.datepicker');
    var selected = $('#selectDay').prop('selectedIndex');
    var picker = datepicker.pickadate('picker');

    if (selected !== "undefined" && selected !== 0) {
        var array = [];
        for (var i = 0; i < 8; ++i) {
            if (i !== selected)
                array.push(i);
        }
        datepicker.prop("disabled", false);
        picker.set('enable', true);
        picker.set('disable', array);
    } else {
        picker.clear();
        datepicker.prop("disabled", true);
    }
}