//= require GooglePieChart

// (function() {
//     var chart = new GooglePieChart();

//     PrivatePub.subscribe("/exchanges/new", function(data, channel) {
//         var newValue = 1000 - chart.data.getValue(0, 1);
//         chart.data.setValue(0, 1, newValue);

//         chart.draw();

//         console.log("exchange", jQuery.parseJSON(data.exchange));
//     });
// })();

$.growl({
    title: '<strong>Hello:</strong> ',
    message: 'How you doin'
},{
    type: 'success'
});