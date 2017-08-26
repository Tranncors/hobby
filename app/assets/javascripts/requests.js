var $;
function showProgress() {
  $('.search-results').hide();
  $('.progress').fadeIn("slow");
}

$(document).ready(function () {
  $('.progress').hide();        //hide gif on page load    
  $('.fetchpage').on('click', showProgress); //and show it after clicking your button
});

$('.dropdown-el').click(function(e) {
  e.preventDefault();
  e.stopPropagation();
  $(this).toggleClass('expanded');
  $('#'+$(e.target).attr('for')).prop('checked',true);
});
$(document).click(function() {
  $('.dropdown-el').removeClass('expanded');
});