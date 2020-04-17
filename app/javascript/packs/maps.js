import {Loader, LoaderOptions} from "google-maps"
import fetch from "unfetch"
import {openDialog} from "./dialog"
import icon from "../../assets/images/marker.png"

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
    let query = window.location.search ? `${window.location.search}&json=true` : `?json=true`
    let res = await fetch(`${window.location.origin}${query}`, {
        headers: {
            Accept: "application/json",
            "Cache-Control": "no-cache "
        }
    })
    let data = await res.json()

    const loader = new Loader(process.env.GOOGLE_CLIENT_KEY)
    const google = await loader.load()

    map = new google.maps.Map(mapHolder, {
        mapTypeControl: false,
        streetViewControl: false
    })
    bounds = new google.maps.LatLngBounds()

    data.data.map(service => {
        let {latitude, longitude} = service.attributes
        if(latitude && longitude){
            let marker = new google.maps.Marker({
                position: new google.maps.LatLng(latitude,longitude),
                map: map,
                //   icon: icon
            })
            bounds.extend(marker.position)
            marker.addListener("click", () => openDialog(service))
        }
    }) 
}