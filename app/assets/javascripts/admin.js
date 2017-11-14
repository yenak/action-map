
$('select').on('change', function() {
  var data = {'class': $(this).attr('class'), 'id': $(this).attr('id'), 'activity': $(this).val()}
  console.log(data)
  $.ajax({
    type: "POST",
    url: "update_activity",
    data: data,
    success: function(response) {
      console.log(response)
    }
  });
});
