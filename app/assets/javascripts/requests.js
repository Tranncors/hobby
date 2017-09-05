var $;
function showProgress() {
  $('.search-results').hide();
  $('.progress').fadeIn("slow");
}

$(document).ready(function () {
  $('.progress').hide();        //hide gif on page load    
  $('.fetchpage').on('click', showProgress); //and show it after clicking your button
});


