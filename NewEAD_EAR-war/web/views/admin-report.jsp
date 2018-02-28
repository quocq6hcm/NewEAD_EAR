<%-- 
    Document   : admin-report
    Created on : Feb 25, 2018, 3:56:46 PM
    Author     : quocq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>      
        <script src="http://www.chartjs.org/samples/latest/utils.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin report Page</title>
    </head>
    <body>
        <div id="canvas-holder" style="width:40%"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
            <canvas id="chart-area" style="display: block; width: 532px; height: 266px;" width="532" height="266" class="chartjs-render-monitor">
            </canvas></div>
        <button id="randomizeData">Randomize Data</button>
        <button id="addDataset">Add Dataset</button>
        <button id="removeDataset">Remove Dataset</button>
        <script>
            function getRandomColor() {
            var letters = '0123456789ABCDEF';
            var color = '#';
            for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
            }
            console.log(getRandomColor())
                    var randomScalingFactor = function() {
                    return Math.round(Math.random() * 100);
                    };
            var config = {
            type: 'pie',
                    data: {
                    datasets: [{
                    data:
                    [
    //                    randomScalingFactor(),
    //                    randomScalingFactor(),
    //                    randomScalingFactor(),
    //                    randomScalingFactor(),
    //                    randomScalingFactor(),
            <c:forEach items="${val}" var="e">
                ${e},
            </c:forEach>

                    ],
                            backgroundColor: [
    //                    window.chartColors.red,
    //                    window.chartColors.orange,
    //                    window.chartColors.yellow,
    //                    window.chartColors.green,
    //                    window.chartColors.blue,
            <c:forEach items="${val}" var="e">
                            getRandomColor(),
            </c:forEach>
                            ],
                            label: 'Dataset 1'
                    }],
                            labels: [
    //                "Red",
    //                "Orange",
    //                "Yellow",
    //                "Green",
    //                "Blue"
            <c:forEach items="${mName}" var="e">
                            "${e}",
            </c:forEach>
                            ]
                    },
                    options: {
                    responsive: true
                    }
            };
            window.onload = function() {
            var ctx = document.getElementById("chart-area").getContext("2d");
            window.myPie = new Chart(ctx, config);
            };
            document.getElementById('randomizeData').addEventListener('click', function() {
            config.data.datasets.forEach(function(dataset) {
            dataset.data = dataset.data.map(function() {
            return randomScalingFactor();
            });
            });
            window.myPie.update();
            });
            var colorNames = Object.keys(window.chartColors);
            document.getElementById('addDataset').addEventListener('click', function() {
            var newDataset = {
            backgroundColor: [],
                    data: [],
                    label: 'New dataset ' + config.data.datasets.length,
            };
            for (var index = 0; index < config.data.labels.length; ++index) {
            newDataset.data.push(randomScalingFactor());
            var colorName = colorNames[index % colorNames.length]; ;
            var newColor = window.chartColors[colorName];
            newDataset.backgroundColor.push(newColor);
            }

            config.data.datasets.push(newDataset);
            window.myPie.update();
            });
            document.getElementById('removeDataset').addEventListener('click', function() {
            config.data.datasets.splice(0, 1);
            window.myPie.update();
            });
        </script>
        <br/>
        <a href="AdminServlet" class="btn btn-info">Back</a>


    </body>
</html>
