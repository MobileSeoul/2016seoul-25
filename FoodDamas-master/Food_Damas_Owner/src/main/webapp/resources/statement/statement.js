var statManager = (function () {	
    function statement(u_id) {
        $.getJSON('sales/' + u_id, function (data) {
        	console.log(data);
            // Data 넣는곳
            var locationData = [
                {
                    type: "column",
                    dataPoints: []
                }
            ];
            var menuData = [
                {
                    type: "column",
                    dataPoints: []
                }
            ];
            var dailyData = [
                {
                    type: "line",

                    dataPoints: []
                }
            ];
            var monthlyData = [
                {
                    type: "line",
                    dataPoints: []
                }
            ];


            // Push 하는곳
            for (var i = 0; i < data.location.length; i++) {
                locationData[0].dataPoints.push({
                    "y": data.location[i].total_price,
                    "label": data.location[i].location
                });
            }

            for (var i = 0; i < data.menu.length; i++) {
                menuData[0].dataPoints.push({
                    "y": data.menu[i].quantity,
                    "label": data.menu[i].m_name
                });
            }

            for (var i = 0; i < data.daily.length; i++) {
                dailyData[0].dataPoints.push({
                    "y": data.daily[i].daily_sales,
                    "label": data.daily[i].ymd
                });
            }
            for (var i = 0; i < data.monthly.length; i++) {
                monthlyData[0].dataPoints.push({
                    "y": data.monthly[i].monthly_sales,
                    "label": data.monthly[i].ym
                });
            }

            // Chart 부분
            var chart = new CanvasJS.Chart("locationChart", {
                zoomEnabled: false,
                title: {
                    text: "Location"
                },
                theme: "theme2",
                animationEnabled: true,
                data: locationData
            });

            chart.render();

            var chart = new CanvasJS.Chart("menuChart", {
                zoomEnabled: false,
                title: {
                    text: "Menu"
                },
                theme: "theme2",
                animationEnabled: true,
                data: menuData
            });

            chart.render();

            var chart = new CanvasJS.Chart("dailyChart", {
                zoomEnabled: false,
                title: {
                    text: "Daily"
                },

                theme: "theme2",
                animationEnabled: true,
                data: dailyData
            });

            chart.render();

            var chart = new CanvasJS.Chart("monthlyChart", {
                zoomEnabled: false,
                animationEnabled: true,
                title: {
                    text: "Monthly",
                },

                theme: "theme2",
                toolTip: {
                    shared: true
                },
                data: monthlyData
            });
            chart.render();
        });

    }

    return {
        statement: statement
    }
})();