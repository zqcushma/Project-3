// main.js

document.getElementById('showMapBtn').addEventListener('click', showMap);
document.getElementById('showChartBtn').addEventListener('click', showChart);

function showMap() {
    document.getElementById('content').innerHTML = '';
    // Include Leaflet-specific logic here
    initializeLeafletMap();
}

function showChart() {
    document.getElementById('content').innerHTML = '';
    // Include Chart.js-specific logic here
    initializeChart();
}
