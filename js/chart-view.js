// chart-view.js

function initializeChart() {
    const canvas = document.createElement('canvas');
    canvas.id = 'chartCanvas';
    document.getElementById('content').appendChild(canvas);

    const ctx = canvas.getContext('2d');
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
            datasets: [
                {
                    label: 'Sample Dataset',
                    data: [12, 19, 3, 5, 2, 3, 8],
                },
            ],
        },
        options: {
            responsive: true,
            scales: {
                x: {
                    type: 'linear',
                },
                y: {
                    type: 'linear',
                },
            },
        },
    });
}
