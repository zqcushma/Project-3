let minBreweries = 9999999;
let maxBreweries = -1;
let breweryRange;
let geoJson;
let info;

// Load brewery and state border data
Promise.all([
    fetch('data/heatmap.json').then(response => response.json()),
    fetch('js/borders.json').then(response => response.json())
]).then(([breweryData, bordersData]) => {


    let mapData = combineFeatures(breweryData, bordersData);
    breweryRange = maxBreweries - minBreweries;
   
    console.log(mapData);
    let map = L.map('map').setView([37.8, -96], 4);

    let tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map);

    geoJson = L.geoJson(mapData, {
        style: style,
        onEachFeature: onEachFeature
    }).addTo(map);

    info = L.control();

    info.onAdd = function (map) {
        this._div = L.DomUtil.create('div', 'info');
        this.update();
        return this._div;
    };

    info.update = function (props) {
        this._div.innerHTML = (props ? `<h4>${props.NAME}</h4><p>Total Breweries: ${props.Breweries}</p>` : "Hover over a state");
    };

    info.addTo(map);

});

function combineFeatures(breweryData, bordersData) {
    let mapData = Object.assign({}, bordersData);
  
    mapData.features.forEach(function(mdf){
        for (let i = 0; i < breweryData.features.length; i++) {
            if (breweryData.features[i].properties.State === mdf.properties.NAME) {
                mdf.properties = Object.assign(mdf.properties, breweryData.features[i].properties);
                break;
            }
        }

        if (mdf.properties.Breweries > maxBreweries)
            maxBreweries = mdf.properties.Breweries;

        if (mdf.properties.Breweries < minBreweries)
            minBreweries = mdf.properties.Breweries;
    });

    return mapData;    
}

function getColor(value) {

    return value < 0.1 ? "#ffffee" :
           value < 0.2 ? "#ffffcc" :
           value < 0.3 ? "#ffeda0" :
           value < 0.4 ? "#fed976" :
           value < 0.5 ? "#feb24c" :
           value < 0.6 ? "#fd8d3c" :
           value < 0.7 ? "#fc4e2a" :
           value < 0.8 ? "#e31a1c" :
           value < 0.9 ? "#bd0026" :
                         "#800026";
}

function style(feature) {
    let pct = (feature.properties.Breweries - minBreweries) / breweryRange;
console.log(feature.properties.Breweries);
    return {
        fillColor: getColor(pct),
        weight: 1,
        opacity: 1,
        color: 'black',
        fillOpacity: 0.7
    };
}

function highlightState(e) {
    var layer = e.target;
    
    layer.setStyle({
        weight: 5,
        color: "#666",
        fillOpacity: 0.7
    });

    layer.bringToFront();
    info.update(layer.feature.properties);
}

function resetState(e) {
    geoJson.resetStyle(e.target);
    info.update();
}

function onEachFeature(feature, layer) {
    layer.on({
        mouseover: highlightState,
        mouseout: resetState
    });
}


    
