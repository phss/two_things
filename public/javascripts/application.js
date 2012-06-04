$(document).ready(function() {
  var popup = new Popup('#entryPopup', '#submit_entry', '/entry/submit');

  $('#new_entry').click(function(event) {
    event.preventDefault();
    popup.open();
  });
});

var Popup = function(popupLocator, submissionLocator, actionUrl) {
  function popupLoaded() {
    $(submissionLocator).click(function(event) {
      event.preventDefault();

      var entry = {};
      $('#submit_form').find('input[id^="entry_"]').each(function(index, element) {
        entry[element.id.replace('entry_', '')] = $(element).val();
      });

      $.post(actionUrl, { entry: entry }, function(data) {
        $(popupLocator).empty().append(data);
        popupLoaded();
      });
    });

    $(popupLocator).show();
  }

  return {
    open: function() {
      $(popupLocator).load(actionUrl, popupLoaded);
    }
  }
};