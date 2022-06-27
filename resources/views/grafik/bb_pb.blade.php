@extends('grafik.layout_grafik')
@section('content')
<div class="container px-3 py-3" style="background:pink;">
    <h6 class="title text-center text-white">Grafik Berat Badan Perempuan Menurut Panjang Badan</h6>
    <canvas class="bg-white" id="linechart"></canvas>
</div>
<script>
    var linechart = $("#linechart")
    //var array range 45 to 110
    var labels = () => {
        var array = [];
        for (var i = 45; i <= 110; i += 5) {
            array.push(i);
        }
        return array;
    };

    let data3 = [3.5, 4.5, 6, 8, 9.5, 11, 12, 13, 14.5, 16.25, 18, 20, 22, 25]
    let data2 = [3.3, 4, 5.5, 7.5, 9, 10.2, 11, 12, 13.5, 15, 16.5, 18, 20, 22.5]
    let data1 = [3.1, 3.6, 5, 6.8, 8.2, 9.2, 10, 11, 12.2, 13.5, 15, 16.4, 18.2, 21]
    // line chartjs
    let data = {
        type: 'line',
        data: {
            labels: labels(),
            datasets: [{
                    data: data3,
                    fill: false,
                    lineTension: 0.2,
                    borderColor: 'black',
                },
                {
                    data: data2,
                    fill: false,
                    lineTension: 0.2,
                    borderColor: 'pink',
                },
                {
                    data: data1,
                    fill: false,
                    lineTension: 0.2,
                    borderColor: 'orange',
                },


            ],
        },
        options: {
            legend: {
                display: false
            },
            elements: {
                point: {
                    radius: 0
                },
                line: {
                    borderWidth: 1
                }
            },
            scales: {
                yAxes: [{
                        ticks: {
                            beginAtZero: true,
                            stepSize: 2,
                            max: 24,
                            min: 2,
                        },
                        scaleLabel: {
                            display: true,
                            labelString: 'Berat Badan (kg)',
                            fontSize: 14,
                        },
                    },
                    {
                        type: 'linear',
                        position: 'right',
                        gridLines: {
                            display: false
                        },
                        ticks: {
                            beginAtZero: true,
                            stepSize: 2,
                            max: 24,
                            min: 0,
                        }
                    }
                ],
                xAxes: [{
                    scaleLabel: {
                        display: true,
                        labelString: 'Panjang Badan (cm)',
                        fontSize: 14,
                    },

                }],




            }
        },

    }


    var lineChart = new Chart(linechart, data);
</script>
@endsection