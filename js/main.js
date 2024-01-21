// Initialize the map and set the initial view
let mymap = L.map('map').setView([37.8, -96], 4);

// Add ESRI background layer to the map
L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/Elevation/World_Hillshade/MapServer/tile/{z}/{y}/{x}', {
    attribution: 'Tiles © Esri'
}).addTo(mymap);

let geojsonLayer;
let alertTimeout;  // Variable to hold the timeout, so it can be cleared

// Function to determine color based on data value and option
function getColor(value, option) {
    let min, max;
    switch (option) {
        case "Production":
            min = 0;
            max = 500000;
            break;
        case "Breweries":
            min = 0;
            max = 200;
            break;
        case "Breweries Per Capita":
            min = 0;
            max = 0.01;
            break;
        default:
            min = 0;
            max = 1;
    }
    let normalized = (value - min) / (max - min);
    let red = Math.round(normalized * 255);
    let blue = 255 - red;
    return `rgb(${red}, 0, ${blue})`;
}

// Load brewery and state border data
Promise.all([
    fetch('data/heatmap.json').then(response => response.json()),
    fetch('js/borders.json').then(response => response.json())
]).then(([breweryData, bordersData]) => {
    // Create geoJSON layer for state borders
    geojsonLayer = L.geoJSON(bordersData, {
        style: {
            color: "#6c757d", // Bootstrap's secondary color
            weight: 2,
            fillOpacity: 0.1
        },
        onEachFeature: (feature, layer) => {
            // Click event for each state
            if (feature.properties && feature.properties.NAME) {
                layer.on('click', () => {
                    let selectedDataOption = d3.select('#dataOption').property('value');

                    // Check if a category has been chosen
                    if (!selectedDataOption || selectedDataOption === "Choose a Category") {
                        let alertBox = document.getElementById('categoryAlert');
                        alertBox.classList.remove('d-none');
                        alertTimeout = setTimeout(() => {
                            alertBox.classList.add('d-none');
                        }, 9000);
                        return;
                    }

                    // Find the state information
                    let stateInfo = breweryData.features.find(f => f.properties.State === feature.properties.NAME);
                    if (stateInfo) {
                        // Update info box with state details
                        document.getElementById('infoBox').innerHTML =
                            `${stateInfo.properties.State}<br>${selectedDataOption}: ${stateInfo.properties[selectedDataOption]}`;

                        // Change color based on the selected data
                        layer.setStyle({
                            fillColor: getColor(stateInfo.properties[selectedDataOption], selectedDataOption),
                            fillOpacity: 0.6
                        });
                    }
                });
            }
        }
    }).addTo(mymap);
}).catch(error => console.error('Error loading GeoJSON:', error));

// Event listener for the data option dropdown
d3.select('#dataOption').on('change', function() {
    // Reset map style and info box content on option change
    if (geojsonLayer) {
        geojsonLayer.resetStyle();
        document.getElementById('infoBox').innerHTML = 'Click on a state';
    }

    // Hide the alert and clear the timeout if it's set
    let alertBox = document.getElementById('categoryAlert');
    if (alertBox && !alertBox.classList.contains('d-none')) {
        alertBox.classList.add('d-none');
        clearTimeout(alertTimeout);  // Clear the existing timeout
    }
});