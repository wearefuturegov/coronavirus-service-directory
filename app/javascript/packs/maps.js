import {Loader, LoaderOptions} from "google-maps"

const toggle = document.querySelector(".map-toggle input")
const mapHolder = document.querySelector(".map-holder")

let map
let bounds

export default () => {
    createMap()
    initialiseToggle()
}

const initialiseToggle = () => {
    toggle.addEventListener("change", e => {
        if(e.target.checked) {
            mapHolder.removeAttribute("hidden")
            toggle.setAttribute("aria-expanded", "true")
            map.fitBounds(bounds)
            map.panToBounds(bounds)
        } else {
            mapHolder.setAttribute("hidden", "true")
            toggle.setAttribute("aria-expanded", "false")
        }
    })
}

const createMap = async () => {
    let res = await fetch(window.location, {
        headers: {Accept: "application/json"}
    })
    let services = await res.json()

    const loader = new Loader(process.env.GOOGLE_CLIENT_KEY)
    const google = await loader.load()

    map = new google.maps.Map(mapHolder, {
        mapTypeControl: false,
        streetViewControl: false
    })
    bounds = new google.maps.LatLngBounds()

    services.map(service => {
        let {latitude, longitude} = service
        let marker = new google.maps.Marker({
          position: new google.maps.LatLng(latitude,longitude),
          map: map
        })
        bounds.extend(marker.position)
        marker.addListener("click", function() {
            // TODO: add detail dialog opening logic here
        })
    }) 
}