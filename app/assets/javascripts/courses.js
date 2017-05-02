$(document).on('turbolinks:load', function () {
    $('select').material_select();

    $('.collapsible').collapsible();

    $('#courseAdminDatepicker').pickadate({
        firstDay: 1,
        min: true,
        selectMonths: true,
        selectYears: true
    });

    initAdminPickdate();

    $('#selectDay').change(function () {
        var datepicker = $('#courseAdminDatepicker');
        var picker = datepicker.pickadate('picker');
        var selected = $(this).prop('selectedIndex');

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

    });

    $('#selectTypeBooking').change(function () {

    });
});

function initAdminPickdate() {
    var datepicker = $('#courseAdminDatepicker');
    var picker = datepicker.pickadate('picker');
    var selected = $('#selectDay').prop('selectedIndex');

    if (picker) {
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
}
