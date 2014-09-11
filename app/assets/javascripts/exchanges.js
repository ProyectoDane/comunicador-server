(function() {
    var remoteData;

    var setHTMLFromData = function(property) {
        if (remoteData[property]) {
            document.getElementById(property).innerHTML = remoteData[property];
        }
    };

    PrivatePub.subscribe("/exchanges/new", function(data, channel) {
        $.growl({
            title: '<strong>Atención:</strong><br />',
            message: 'Nueva interacción!!'
        },{
            type: 'success'
        });

        remoteData = data;

        setHTMLFromData("users_count");
        setHTMLFromData("cards_count");
        setHTMLFromData("exchanges_count");
        setHTMLFromData("receivers_count");

        console.log(remoteData)

        setTimeout(function() {
            window.location.reload();
        }, 2000);
    });
})();
