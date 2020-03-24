const {Loader} = require('google-maps');

const loader = new Loader('YOUR_BROWSER_API_KEY', {});

const addMarker = (map, serviceCard) => {
    const latitude = serviceCard.dataset.latitude;
    const longitude = serviceCard.dataset.longitude;
    if (!latitude || !longitude) return;

    const title = serviceCard.querySelector('.service-card__name').textContent;
    const position = new google.maps.LatLng(Number.parseFloat(latitude), Number.parseFloat(longitude));
    const marker = new google.maps.Marker({ position, title, map });
    const infoWindow = new google.maps.InfoWindow({ content: title });
    marker.addListener('click', () => {
        infoWindow.open(map, marker);
    });
};

const createMap = (element) => {
    loader.load().then((google) => {
        const map = new google.maps.Map(element, {
            center: {lat: 51.53294, lng: -0.12506},
            zoom: 14,
        });
        document.querySelectorAll('.service-card').forEach(serviceCard => addMarker(map, serviceCard));
    });
};

document.addEventListener("DOMContentLoaded", (ev) => {
    const element = document.querySelectorAll('.results-map-section_map');
    if (element.length) createMap(element[0]);
});