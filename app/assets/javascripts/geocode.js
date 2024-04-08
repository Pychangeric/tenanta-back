// app/assets/javascripts/geocode.js

document.addEventListener("turbolinks:load", function() {
    function geocodeLocation() {
      var location = document.getElementById('residence_location').value;
      var geocoder = new google.maps.Geocoder();
  
      geocoder.geocode({ 'address': location }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          var latitude = results[0].geometry.location.lat();
          var longitude = results[0].geometry.location.lng();
  
          document.getElementById('latitude').value = latitude;
          document.getElementById('longitude').value = longitude;
        } else {
          console.log('Geocode was not successful for the following reason: ' + status);
        }
      });
    }
  
    // Call the geocodeLocation function when the form is submitted
    document.addEventListener("submit", function(event) {
      if (event.target.id === "new_residence") {
        geocodeLocation();
      }
    });
  });
  