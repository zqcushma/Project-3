// leaflet-view.js

// Variable to track if the map has been initialized
let mapInitialized = false;

// Function to initialize the Leaflet map
function initializeLeafletMap() {
    // Check if the map container exists
    const mapContainer = document.getElementById('content');

    if (mapContainer && !mapInitialized) {
        const map = L.map('content').setView([37.7749, -122.4194], 10); // San Francisco coordinates as an example
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);

        // Additional Leaflet-specific logic can go here

        // Set the mapInitialized variable to true
        mapInitialized = true;
    } else {
        console.warn("Leaflet map is already initialized or map container not found.");
    }
}

// Call the Leaflet initialization function when this file is included
initializeLeafletMap();
