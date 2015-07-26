/**
 * Created by anthony on 10/07/15.
 */
var gaugeOptions = {

    chart: {
        type: 'solidgauge',
        spacingBottom: 0
    },

    title: null,

    pane: {
        center: ['50%', '100%'],
        size: '200%',
        startAngle: -90,
        endAngle: 90,
        background: {
            innerRadius: '60%',
            outerRadius: '100%',
            shape: 'arc'
        }
    },

    tooltip: {
        enabled: false
    },

    // the value axis
    yAxis: {
        stops: [
            [0.1, '#DF5353'],
            [0.6, '#DDDF0D'],
            [0.9, '#55BF3B']
        ],
        lineWidth: 3,
        minorTickInterval: null,
        tickPixelInterval: null,
        tickWidth: 5,
        labels: {
            y: 16,
            style : {
                fontSize : "16px"
            }
        }
    },

    plotOptions: {
        solidgauge: {
            dataLabels: {
                y: 0,
                borderWidth: 0,
                useHTML: true
            }
        }
    }
};