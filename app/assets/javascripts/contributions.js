/**
 * Created by anthony on 10/07/15.
 */

$(document).on('ready page:load', function () {

    $.getJSON("../api/contributions_average", function (data) {

        $('#gauge-import-average').highcharts(Highcharts.merge(commonChartOption, gaugeOptions, {
            yAxis: {
                min: 0,
                max: 200
            },
            credits: {
                enabled: false
            },
            series: [{
                data: [data],
                dataLabels: {
                    format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                    ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>'
                }
            }]

        }));
    });

    $.getJSON("../api/contributions_evolution", function (data) {

        $('#evolution').highcharts(Highcharts.merge(commonChartOption, {
            chart: {
                type: 'column'
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
            series: [{
                name: 'Ajouts',
                data: data

            }]
        }));
    });
});