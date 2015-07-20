/**
 * Created by anthony on 10/07/15.
 */

var commonChartOption = {
    colors: ['#7cb5ec', '#434348', '#90ed7d', '#f7a35c', '#8085e9',
        '#f15c80', '#e4d354', '#2b908f', '#f45b5b', '#91e8e1'],
    credits: {
        enabled: false
    },
    title: {
        text: ""
    },

    yAxis: {
        title: {
            style: {
                fontSize: "16px",
                color: "#424242"
            }
        }
    },

    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '{point.name}: {point.percentage:.1f} %',
                style: {
                    fontSize: '14px',
                    fontWeight: "bold",
                    color: '#424242'
                }
            }
        }
    }
}