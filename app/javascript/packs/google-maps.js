const {Loader} = require('google-maps');

const browserKey = process.env.GOOGLE_BROWSER_API_KEY;
if (browserKey == null) throw Error('Google API Browser key was not configured');
const loader = new Loader(browserKey, {});

/**
 * Given a google map element and a service card
 * pull the information to display the service card information on the map
 * @param map A google.maps.Map element
 * @param serviceCard A card element in the display list
 */
const addMapMarker = (map, serviceCard) => {
    const latitude = serviceCard.dataset.latitude;
    const longitude = serviceCard.dataset.longitude;

    // Not enough information on this card to display on map
    if (!latitude || !longitude) return;

    const title = serviceCard.querySelector('.service-card__name').textContent;
    const position = new google.maps.LatLng(Number.parseFloat(latitude), Number.parseFloat(longitude));
    const marker = new google.maps.Marker({ position, title, map });

    // Display service summary on map marker click
    const infoWindow = new google.maps.InfoWindow({ content: title });
    marker.addListener('click', () => {
        infoWindow.open(map, marker);
    });
};

/**
 * For a map display section with embedded coordinate information
 * create a google.map.Map item centered on those coordinates
 * @param element
 */
const createMap = async (element) => {
    const google = await loader.load();
    const coordinates = JSON.parse(element.dataset.coordinates);
    const centreCoordinates = new google.maps.LatLng(coordinates[0], coordinates[1]);
    return new google.maps.Map(element, {
        center: centreCoordinates,
        zoom: 14,
    });
};

const onPageLoaded = async () => {
    const element = document.querySelector('.results-map-section_map');
    if (!element) return;

    const map = await createMap(element);
    const searchResultCards = document.querySelectorAll('.service-card');
    searchResultCards.forEach(serviceCard => addMapMarker(map, serviceCard));

    const displayMapToggle = document.querySelector('.results-map-section_slider-bar_toggle');
    if (!displayMapToggle) throw new Error('No map toggle element present on page');

    // Hide or display map section on change
    displayMapToggle.addEventListener('change', e => element.style.display = e.target.checked ? "block" : "none");
};

document.addEventListener('DOMContentLoaded', () => onPageLoaded());