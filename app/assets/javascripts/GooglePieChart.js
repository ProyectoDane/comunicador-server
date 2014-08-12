var GooglePieChart = function(chartElement) {
    google.load('visualization', '1.0', {'packages':['corechart']});

    this.chartElement = chartElement || document.getElementById("chart-element");

    google.setOnLoadCallback(this.init.bind(this));
};

GooglePieChart.prototype = {
    options: {
        'title':'Interactions',
        'width':400,
        'height':300,
        'animation': {
            'duration': 1000,
            'easing': 'out',
        }
    },
    init: function() {
        this.data = new google.visualization.DataTable();

        this.data.addColumn('string', 'Topping');
        this.data.addColumn('number', 'Slices');
        this.data.addRows([
            ['Mushrooms', 3],
            ['Onions', 1],
            ['Olives', 1],
            ['Zucchini', 1],
            ['Pepperoni', 2]
        ]);

        this.chart = new google.visualization.PieChart(this.chartElement);

        this.draw();
    },
    draw: function() {
        this.chart.draw(this.data, this.options);
    }
};