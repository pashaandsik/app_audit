jQuery ->
  detales=$("#detail_parent_id").html()
  $('#detail_car_id').change ->

    car = $('#detail_car_id option:selected').text()
    op = $(detales).filter("optgroup[label='#{ car }']").html()
    if op
      $('#detail_parent_id').html(op)
      $('#detail_parent_id').prepend("<option> </option>")
    else
      $('#detail_parent_id').prepend("<option> </option>")
      $('#detail_parent_id').empty()

