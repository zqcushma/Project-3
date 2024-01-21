let minBreweries = 9999999;
let maxBreweries = -1;
let breweryRange;

let minProduction = 9999999999;
let maxProduction = -1;
let productionTotal = 0;
let productionRange;

let maxAverage = -1;
let minAverage = 9999999999;
let averageRange;

// TODO: Add Min/Max for Breweries per Capita (??)

let map;
let geoJsonBreweries, geoJsonProduction, geoJsonAverage;
let legendBreweries, legendProduction, legendAverage;

let activeGeoJson, activeLegend;

let info;

let currentState;
let currentMap = "Breweries";

let dropDown = document.querySelector("#dataOption");
dropDown.addEventListener("change", onDropDownChange);

let chartDropDown = document.querySelector("#chart-select");
chartDropDown.addEventListener("change", onChartDropDownChange);

let modalTitle = d3.select(".modal-title");

let rankBreweries, rankProduction, rankAverage;

// Load brewery and state border data
Promise.all([
    fetch('data/heatmap.json').then(response => response.json()),
    fetch('js/borders.json').then(response => response.json())
]).then(([breweryData, bordersData]) => {


    let mapData = combineFeatures(breweryData, bordersData);
    breweryRange = maxBreweries - minBreweries;
    productionRange = maxProduction - minProduction;
    averageRange = maxAverage - minAverage;

    rankBreweries = sortData(breweryData, "Breweries");
    rankProduction = sortData(breweryData, "Production");
    rankAverage = sortData(breweryData, "Average");

    map = L.map('map-graph').setView([37.8, -96], 4);

    let tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map);

    geoJsonBreweries = new L.geoJson(mapData, {
        style: styleFactory("Breweries"),
        onEachFeature: onEachFeature
    }).addTo(map);
    activeGeoJson = geoJsonBreweries;

    geoJsonProduction = new L.geoJson(mapData, {
        style: styleFactory("Production"),
        onEachFeature: onEachFeature
    });

    geoJsonAverage = new L.geoJson(mapData, {
        style: styleFactory("Average"),
        onEachFeature: onEachFeature
    });

    info = new L.control();

    info.onAdd = function (map) {
        this._div = L.DomUtil.create('div', 'info');
        this.update();
        return this._div;
    };

    info.update = function (props) {
        // TODO: Add production and per capita data to the info display
        this._div.innerHTML = (props ? 
            `<div class="card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">${props.NAME}</h5>
                    <p class="card-text"><strong>Total Beer Production:</strong> ${numberFormat(props.Production)} Barrels<br/>
                    <em>${numberFormat((props.Production / productionTotal) * 100, 2)}% Total U.S. Production<br/><br/>
                    <strong>Total Breweries:</strong> ${numberFormat(props.Breweries)}<br/>
                    <strong>Average Barrels per Brewery:</strong> ${numberFormat(props.Production / props.Breweries)}</p>
                </div>
                <div class="card-footer text-muted text-center">1 Barrel = 31 Gallons</div>
             </div>` 
            : "");
    };

    info.addTo(map);

    legendBreweries = new L.control({position: "bottomright"});
    legendBreweries.onAdd = function (map) {
        let div = L.DomUtil.create("div", "legend");
        div.innerHTML = "<p>Breweries</p>";
        for (let i = 0; i < 10; i++) {
            div.innerHTML += '<i style="background: ' + getColor(i / 10, "Breweries") + ';"></i>';
            div.innerHTML += numberFormat(Math.floor(breweryRange * i / 10) + minBreweries);
            div.innerHTML += "&nbsp;&ndash;&nbsp;";
            div.innerHTML += i < 9 ? numberFormat(Math.floor(breweryRange * (i + 1) / 10) + minBreweries - 1) : numberFormat(maxBreweries);
            div.innerHTML += '<br />';
        }
        return div;
    }
    legendBreweries.addTo(map);
    activeLegend = legendBreweries;

    legendProduction = new L.Control({position: "bottomright"});
    legendProduction.onAdd = function (map) {
        let div = L.DomUtil.create("div", "legend");
        div.innerHTML = "<p>Barrels</p>";
        for (let i = 0; i < 10; i++) {
            div.innerHTML += '<i style="background: ' + getColor(i / 10, "Production") + ';"></i>';
            div.innerHTML += numberFormat(Math.floor(productionRange * i / 10) + minProduction);
            div.innerHTML += "&nbsp;&ndash;&nbsp;";
            div.innerHTML += i < 9 ? numberFormat(Math.floor(productionRange * (i + 1) / 10) + minProduction - 1) : numberFormat(maxProduction);
            div.innerHTML += '<br />';
        }
        return div;
    }

    legendAverage = new L.Control({position: "bottomright"});
    legendAverage.onAdd = function(map) {
        let div = L.DomUtil.create("div", "legend");
        div.innerHTML = "<p>Barrels</p>";
        for (let i = 0; i < 10; i++) {
            div.innerHTML += '<i style="background: ' + getColor(i / 10, "Average") + ';"></i>';
            div.innerHTML += numberFormat(Math.floor(averageRange * i / 10) + minAverage);
            div.innerHTML += "&nbsp;&ndash;&nbsp;";
            div.innerHTML += i < 9 ? numberFormat(Math.floor(averageRange * (i + 1) / 10) + minAverage - 1) : numberFormat(maxAverage);
            div.innerHTML += '<br />';
        }
        return div;
    }
});

function combineFeatures(breweryData, bordersData) {
    let mapData = Object.assign({}, bordersData);
    mapData.features.forEach(function(mdf){
        let eliminate = true;

        for (let i = 0; i < breweryData.features.length; i++) {
            if (breweryData.features[i].properties.State === mdf.properties.NAME) {
                mdf.properties = Object.assign(mdf.properties, breweryData.features[i].properties);
                eliminate = false;
                break;
            }
        }

        if (!eliminate) {
            if (mdf.properties.Breweries > maxBreweries)
                maxBreweries = mdf.properties.Breweries;

            if (mdf.properties.Breweries < minBreweries)
                minBreweries = mdf.properties.Breweries;

            // TODO: Add code to find the min/max for production and per capita
            productionTotal += mdf.properties.Production;
            if (mdf.properties.Production > maxProduction)
                maxProduction = mdf.properties.Production;

            if (mdf.properties.Production < minProduction)
                minProduction = mdf.properties.Production;

            let avg = parseInt(mdf.properties.Production / mdf.properties.Breweries);
            if (avg < minAverage)
                minAverage = avg;

            if (avg > maxAverage)
                maxAverage = avg;
        } else {
            mdf.eliminate = true;
        }
    });

    mapData.features = mapData.features.filter(mdf => !mdf.eliminate);

    return mapData;    
}

function sortData(data, type) {
    let results = [];

    data.features.forEach(function(f) {
        switch (type) {
            case "Breweries":
                results.push({ state: f.properties.State, value: f.properties.Breweries });
                break;
            
            case "Production":
                results.push({ state: f.properties.State, value: f.properties.Production });
                break;

            case "Average":
                results.push({ state: f.properties.State, value: parseInt(f.properties.Production / f.properties.Breweries) });
                break;
        }
    });

    results.sort((a, b) => b.value - a.value);
    return results;
}

function getColor(value, type) {
    if (type === "Breweries") {
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

    } else if (type === "Production") {
        return value < 0.1 ? "#f7fff5" :
               value < 0.2 ? "#f7f0f5" :
               value < 0.3 ? "#e5f5e0" :
               value < 0.4 ? "#c7e9c0" :
               value < 0.5 ? "#a1d99b" :
               value < 0.6 ? "#74c476" :
               value < 0.7 ? "#41ab5d" :
               value < 0.8 ? "#238b45" :
               value < 0.9 ? "#006d2c" :
                             "#00441b";
    } else if (type == "Average") {
        return value < 0.1 ? "#fff7fb" :
               value < 0.2 ? "#ece7f2" :
               value < 0.3 ? "#d0d1e6" :
               value < 0.4 ? "#a6bddb" :
               value < 0.5 ? "#74a9cf" :
               value < 0.6 ? "#3690c0" :
               value < 0.7 ? "#0570b0" :
               value < 0.8 ? "#045a8d" :
               value < 0.9 ? "#023858" :
                             "#011929";
    }
}

function styleFactory(type) {
    let styleObject = {
        weight: 1,
        opacity: 1,
        color: 'black',
        fillOpacity: 0.7
    };

    if (type == "Breweries") {
        return (function (feature) {
            let pct = (feature.properties.Breweries - minBreweries) / breweryRange;

            return Object.assign(styleObject, { fillColor: getColor(pct, type) });
        });
    }

    if (type == "Production") {
        return (function (feature) {
            let pct = (feature.properties.Production - minProduction) / productionRange;
            return Object.assign(styleObject, { fillColor: getColor(pct, type) });
        });
    }

    if (type == "Average") {
        return (function (feature) {
            let pct = ((feature.properties.Production / feature.properties.Breweries) - minAverage) / averageRange;

            return Object.assign(styleObject, { fillColor: getColor(pct, type) });
        });
    }
}

function numberFormat(num, dec) {
    let decimals = dec || 0;
    let number = parseInt(num * (10 ** decimals)) / (10 ** decimals);
    return number.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
}

function ordinal(num) {
    if (parseInt(num / 10) !== 1) {
        if (num % 10 === 1)
            return num + "st"
        if (num % 10 === 2)
            return num + "nd"
        if (num % 10 === 3)
            return num + "rd"
    }

    return num + "th";
}

function highlightState(e) {
    var layer = e.target;
    
    layer.setStyle({
        weight: 4,
        color: "#444",
        fillOpacity: 0.7
    });

    layer.bringToFront();
    info.update(layer.feature.properties);
}

function resetState(e) {
    activeGeoJson.resetStyle(e.target);
    info.update();
    
}

function generateChart(view) {
    let data;
    let title;
    let category;

    switch (view) {
        case "Breweries":
            data = rankBreweries;
            category = "Breweries";
            break;

        case "Production":
            data = rankProduction;
            category = "Beer Production (in Barrels)"
            break;

        case "Average":
            data = rankAverage;
            category = "Average Barrels Produced per Brewery";
            break;
    }

    for (let i = 0; i < data.length; i++) {
        if (data[i].state === currentState) {
            title = `${ordinal(i + 1)} in ${category}`;
            break;
        }
    }

    let svg = d3.select("svg");
    svg.selectAll("text").remove();
    svg.selectAll("g").remove();

    let margin = 100;
    let width = svg.attr("width") - margin;
    let height = svg.attr("height") - margin;

    let xScale = d3.scaleBand().range([0, width]).padding(0.4);
    let yScale = d3.scaleLinear().range([height, 0]);

    svg.append("text")
        .attr("transform", "translate(100,0)")
        .attr("x", 50)
        .attr("y", 50)
        .attr("font-size", "24px")
        .text(title);

    let g = svg.append("g")
        .attr("transform", "translate(50,10)");

    xScale.domain(data.map(d => d.state));
    yScale.domain([0, d3.max(data, d => d.value)]);

    g.append("g")
        .attr("transform", `translate(0,${height})`)
        .call(d3.axisBottom(xScale))
        .selectAll("text")
            .style("text-anchor", "end")
            .attr("dx", "-.8em")
            .attr("dy", ".15em")
            .attr("transform", "rotate(-65)");

    g.append("g")
        .call(d3.axisLeft(yScale).ticks(10));

    g.selectAll(".bar")
        .data(data)
        .enter().append("rect")
        .attr("class", d => `bar${d.state === currentState ? " current" : ""}`)
        .attr("x", d => xScale(d.state))
        .attr("y", d => yScale(d.value))
        .attr("width", xScale.bandwidth())
        .attr("height", d => height - yScale(d.value))
}

function onEachFeature(feature, layer) {
    layer.on({
        mouseover: highlightState,
        mouseout: resetState,
        click: onStateClicked
    });
}

function onChartDropDownChange(e) {
    generateChart(e.target.value);
}

function onDropDownChange(e) {
    activeGeoJson.remove();
    activeLegend.remove();

    if (e.target.value === "Breweries") {
        activeGeoJson = geoJsonBreweries;
        activeLegend = legendBreweries;
    } else if (e.target.value === "Production") {
        activeGeoJson = geoJsonProduction;
        activeLegend = legendProduction;
    } else if (e.target.value === "Average") {
        activeGeoJson = geoJsonAverage;
        activeLegend = legendAverage;
    }

    activeGeoJson.addTo(map);
    activeLegend.addTo(map);
    currentMap = e.target.value;
};
    
function onStateClicked(e) {
    currentState = e.target.feature.properties.NAME;
    modalTitle.html(currentState);
    chartDropDown.value = dropDown.value;
    generateChart(currentMap);
    $('#quarterly-data').modal("toggle");
}