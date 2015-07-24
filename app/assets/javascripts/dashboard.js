/**
 * Created by anthony on 10/07/15.
 */

$(document).on('ready page:load', function () {

    $.getJSON("../api/countType", function (data) {

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
});