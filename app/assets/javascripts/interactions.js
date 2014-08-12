//= require GooglePieChart

(function() {
    var chart = new GooglePieChart();

    PrivatePub.subscribe("/interactions/new", function(data, channel) {
        var newValue = 1000 - chart.data.getValue(0, 1);
        chart.data.setValue(0, 1, newValue);

        chart.draw();

        console.log("Interaction", jQuery.parseJSON(data.interaction));
    });
})();