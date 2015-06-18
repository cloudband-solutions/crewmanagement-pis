$(function() {
  $('.crew-list-btn').on('click', function(evt) {
    evt.preventDefault();

    var vesselId = $(this).data('vessel-id')
    // Reference to handlebar template
    var source = $("#entry-template").html();
    var template = Handlebars.compile(source);
    var $modal = $(".crew-list-modal")

    console.log(vesselId);

    $.ajax({
      url: "/api/vessels/crew_list/" + vesselId
    }).done(function(data) {
      $modal.modal();
      console.log(data);

      var context = { crews:  data['crews'] }

      // variable to hold handlebar generated html
      var html = template(context);
      $modal.find(".vesselName").html(data['vessel']);
      $modal.find(".modal-body-content").html(html);
    });
  })
});
$(function() {
  $('#newTransmittalRecordBtn').on('click', function(evt) {
    evt.preventDefault();
    var $modal = $('.vessel-select-modal');
    $modal.modal();
  });
});
