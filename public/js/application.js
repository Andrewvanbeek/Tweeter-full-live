$(document).ready(function() {
  $("#positions").on("submit", function(e){
    e.preventDefault();
    function handleGetCurrentPosition(location){
      var url = $("#positions").attr("action")
      var latitude = location.coords.latitude;
      var longitude = location.coords.longitude;
      var comment = $("textarea[name='comment']").val()
      var title = $("input[name='title']").val()
      console.log(url)
      console.log(comment)
      var position = {title: title, latitude: latitude, longitude: longitude, comment}
      $.ajax({
        url: url,
        type: 'POST',
        data: position,
      })
      .done(function() {
        console.log("success");
      })
    }
    var spot = navigator.geolocation.getCurrentPosition(handleGetCurrentPosition)
  })
});












