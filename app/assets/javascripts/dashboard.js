/**
 * Created by anthony on 10/07/15.
 */

$(document).on('ready page:load', function () {

    $.getJSON("../api/types_count", function (data) {

        $('#types-count').highcharts(Highcharts.merge(commonChartOption, {
            tooltip: {
                headerFormat: '<b>{point.key}</b><br>',
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            series: [{
                type: 'pie',
                name: 'Total',
                data: data
            }]
        }));
    });



    var chart = {
        chart: {
            type: 'line'
        },
        xAxis:{
            type: 'category'
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Données importés'
            }
        },
        plotOptions: {
            area: {
                stacking: 'percent'
            }
        },
        tooltip: {
            pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.percentage:.1f}%</b> ({point.y:,.0f})<br/>',
            shared: true
        },
        series: []
    };

    var data = [];

    for(var i = 1; i<=8; i++){
        data[i] = $.getJSON("../api/types_evolution/"+i, function (data) {
            chart.series.push({
                color: data.color,
                name: data.category,
                data: data.data
            });
        });
    }

    $.when(data[1],data[2],data[3],data[4],data[5],data[6],data[7],data[8]).done(function(){
        $('#evolution-types').highcharts(Highcharts.merge(commonChartOption, chart));
    });

});
