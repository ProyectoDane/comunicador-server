PrivatePub.subscribe("/interactions/new", function(data, channel) {
  console.log("Interaction", jQuery.parseJSON(data.interaction));
});