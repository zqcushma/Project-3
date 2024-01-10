// main.js

// Function to display Leaflet map
function showMap() {
    document.getElementById('content').innerHTML = '<div id="leafletMap" style="height: 400px;"></div>';
    // Include logic specific to the Leaflet view if needed
}

// Function to display Chart.js chart
function showChart() {
    const canvas = document.createElement('canvas');
    canvas.id = 'chartCanvas';
    document.getElementById('content').innerHTML = '';
    document.getElementById('content').appendChild(canvas);

    const ctx = canvas.getContext('2d');
    // Include logic specific to the Chart.js view if needed
}

// Function to display the third view
function showThirdView() {
    document.getElementById('content').innerHTML = '<div>This is the third view</div>';
    // Include logic specific to the third view if needed
}

// Your code for switching between views
document.getElementById('showMapBtn').addEventListener('click', showMap);
document.getElementById('showChartBtn').addEventListener('click', showChart);
document.getElementById('showThirdViewBtn').addEventListener('click', showThirdView);

// Additional common code can go here
