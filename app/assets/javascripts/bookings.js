document.addEventListener('turbolinks:load', function () {
    $('#selectTypeBooking').change(function () {
        $('#formBooking_type').val($(this).prop('checked'));
    });

    $('#bookingPublicDatepicker').pickadate({
        firstDay: 1,
        min: new Date($('#minDate').prop('value')),
        selectMonths: true,
        selectYears: true
    });

    initPublicPickdate();
});

function initPublicPickdate() {
    var picker = $('#bookingPublicDatepicker').pickadate('picker');
    var selected = parseInt($('#courseDay').prop('value'));

    var array = [];
    for (var i = 0; i < 8; ++i) {
        if (i !== selected)
            array.push(i);
    }
    if (picker) {
        $('#bookingPublicDatepicker').clear();
        picker.set('enable', true);
        picker.set('disable', array);
    }
}