/**
 * Created by Mr_Quang on 9/24/2016.
 */
dashboard.controller("homeCtrl", function ($http, $scope, dashboardService, appSettings, $resource) {
    var vm = this;
    var apiBase = appSettings.apiBase;

    vm.dateClick= function()
    {
        console.dir(vm.datePicker);
    }

    $('#datetimepicker1').datetimepicker(
        {
            defaultDate: new Date(),
            calendarWeeks:true,
            viewMode: 'days',
            format: 'YYYY-MM-DD',
            showTodayButton:true,
            locale :'ko'

        }
    );
    var datePicker ="";
    $("#datetimepicker1").on("dp.change", function(e) {
        alert($('#datePickerText').val());
        datePicker = $('#datePickerText').val();
        console.dir(datePicker);
    });





    /*Init Box Info*/
    {
        dashboardService.getListTotal().then(function (data) {
            vm.listTotalBox = [
                {
                    box_bground: 'bg-yellow-active',
                    box_data: data.total_customer,
                    box_title: 'Food Truck Member',
                    box_icon: 'fa-users'
                },
                {
                    box_bground: 'bg-blue-active',
                    box_data: data.total_notice,
                    box_title: 'Total Notice',
                    box_icon: 'fa-question'
                },
                {
                    box_bground: 'bg-green-active',
                    box_data: data.total_question,
                    box_title: 'Total Question',
                    box_icon: 'fa-question'
                },
                {
                    box_bground: 'bg-light-blue-active',
                    box_data: data.total_answer,
                    box_title: 'Total Answer',
                    box_icon: 'fa-comment'
                }
            ];
        });
    }
    /*End Init Box Info*/
    /*Init Chart*/
    /*Line Chart */
    {
        var memberChart = document.getElementById("memberChart").getContext("2d");
        vm.totalMemberByMonth = function () {
            var myRecor1 = $resource(apiBase + '/memberTotalByMonth');
            var myRecord = myRecor1.query(function () {
                vm.myFunct(myRecord, "Month");
            });
        }
        vm.totalMemberByDate = function () {
            var dateRecords = $resource(apiBase + '/memberTotalByDate');
            var dateRecord = dateRecords.query(function () {
                vm.myFunct(dateRecord, "Date");
            });
        }
        vm.myFunct = function (data, xTitle) {
            var dataArr = [];
            var labelArr = [];
            for (var i = 0; i < data.length - 1; i++) {
                dataArr.push(data[i].total);
                labelArr.push(data[i].regtime);
            }
            var maxValue = data[data.length - 1].maxValue;
            var memberLineChartDataConfig = {
                labels: labelArr,
                datasets: [
                    {
                        label: "Food Truck Member By Month",
                        fill: false,
                        lineTension: 0.0,
                        backgroundColor: "rgba(75,192,192,0.4)",
                        borderColor: "rgba(75,192,192,1)",
                        borderCapStyle: 'butt',
                        borderDash: [],
                        borderDashOffset: 0.0,
                        borderJoinStyle: 'miter',
                        pointBorderColor: "rgba(75,192,192,1)",
                        pointBackgroundColor: "#fff",
                        pointBorderWidth: 1,
                        pointHoverRadius: 5,
                        pointHoverBackgroundColor: "rgba(75,192,192,1)",
                        pointHoverBorderColor: "rgba(220,220,220,1)",
                        pointHoverBorderWidth: 2,
                        pointRadius: 1,
                        pointHitRadius: 10,
                        data: dataArr
                    }
                ]
            }
            var myLineChart = Chart.Line(memberChart, {
                type: 'line',
                data: memberLineChartDataConfig,
                options: {
                    responsive: true,

                    legend: {
                        position: 'bottom',
                    },
                    hover: {
                        mode: 'label'
                    },
                    scales: {
                        xAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: xTitle
                            }
                        }],
                        yAxes: [{
                            display: true,
                            ticks: {
                                beginAtZero: true,
                                steps: 10,
                                stepValue: 5,
                                max: maxValue
                            }
                        }]
                    }
                }
            });
            return myLineChart;
        }
        vm.totalMemberByDate();
    }
    /*End Line Chart*/
    /*Bar Chart*/
    {
        var qnaChart = document.getElementById("qnaChart").getContext("2d");
        vm.getCountQnAByMonth = function () {
            var monthRecords = $resource(apiBase + '/getCountQnAByMonth');
            var monthRecord = monthRecords.query(function () {
                vm.barChartFunc(monthRecord);
            });
        }
        vm.barChartFunc = function (data) {
           /* console.dir(data);*/
            var dataArrQuestion = [];
            var dataArrAnswer = [];
            var labelArr = [];
            var maxBarValue = 0;
            for (var i = 0; i < data.length; i++) {
                dataArrQuestion.push(data[i].total_question);
                dataArrAnswer.push(data[i].total_answer);
                labelArr.push(data[i].regmonth);
                maxBarValue += data[i].total_question;
            }
            var qnaBarChartDataConfig = {
                labels: labelArr,
                datasets: [
                    {
                        label: 'Question',
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgba(255,99,132,1)',
                        data: dataArrQuestion
                    },
                    {
                        label: 'Answer',
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        data: dataArrAnswer
                    }
                ]
            }
            var qnaRealBarChart = new Chart(qnaChart, {
                type: 'bar',
                data: qnaBarChartDataConfig,
                options: {
                    responsive: true,

                    legend: {
                        position: 'bottom',
                    },
                    hover: {
                        mode: 'label'
                    },
                    scales: {
                        xAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'Month'
                            }
                        }],
                        yAxes: [{
                            display: true,
                            ticks: {
                                beginAtZero: true,
                                steps: 10,
                                stepValue: 5,
                                max: maxBarValue
                            }
                        }]
                    }
                }
            });
            return qnaRealBarChart;
        }
        vm.getCountQnAByMonth();
    }
    /* End Bar Chart*/
    /*End Init Chart*/
    /* $http({
     method: 'GET',
     url: apiBase+'/getMaxCountMember'
     }).then(
     function successCallback(response) {
     console.dir('This is the response');
     console.dir(response);
     var aaa = response.data;
     return response.data;
     }, function errorCallback(response) {
     console.dir('This is the error');
     console.dir(response);
     return response;
     }
     );
     console.dir("Main :" + aaa);
     var aa;
     var getPonies = function() {
     // You should return $http's result
     // $http will return a promise
     return $http({
     method: 'GET',
     url: apiBase+'/getMaxCountMember'
     }).then(
     function successCallback(response) {
     console.dir('This is the response');
     console.dir(response);
     aa = response.data;
     return response.data;
     }, function errorCallback(response) {
     console.dir('This is the error');
     console.dir(response);
     return response;
     }
     );
     };
     getPonies();
     */


})