$(document).on('turbolinks:load', function () {
    $('#selectDeletePics').imagepicker({
        changed: function () {
            var selected = $(this).val();
            if (selected !== null && selected.length > 0) {
                $('#buttonDeletePictures').prop('disabled', false);
            } else {
                $('#buttonDeletePictures').prop('disabled', true);
            }
        }
    });
});