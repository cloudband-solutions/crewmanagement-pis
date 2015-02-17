function callCrewListModal(vesselId) {
  $(".crew-list-modal").modal();
  console.log(vesselId);

  // Reference to handlebar template
  var source = $("#entry-template").html();
  var template = Handlebars.compile(source);


  $.ajax({
    url: "/api/vessels/crew_list/" + vesselId
  }).done(function(data) {
    console.log(data);

    var context = { crews:  data['crews'] }

    // variable to hold handlebar generated html
    var html = template(context);
    $(".vesselName").html(data['vessel']);
    $(".modal-body-content").html(html);
  });

}

