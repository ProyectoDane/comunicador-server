(function() {
    var notify = function() {
        $.growl({
            title: '<strong>Atención:</strong><br />',
            message: 'Nueva interacción!!'
        }, {
            type: 'success'
        });
    };
    var redraw = function(chartName) {
        $.get("/exchanges/" + chartName, function(response) {
            var chart = charts[chartName]; 
            chart.setData(response);
            chart.redraw();
        });
    };

    PrivatePub.subscribe("/exchanges/new", function(data, channel) {
        var setHTMLFromData = function(property) {
            if (data[property]) {
                document.getElementById(property).innerHTML = data[property];
            }
        };

        notify();

        setHTMLFromData("users_count");
        setHTMLFromData("cards_count");
        setHTMLFromData("exchanges_count");
        setHTMLFromData("receivers_count");

        redraw("by_month");
        redraw("by_receiver_name");
        redraw("by_user_name");

        if (data.exchangeHTML) {
            $("#exchanges").append(data.exchangeHTML);
        }
    });
})();
