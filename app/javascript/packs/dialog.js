import MicroModal from "micromodal"
import fetch from "unfetch"

MicroModal.init({
    openClass: "is-open",
    disableScroll: true
});

let triggers = document.querySelectorAll(".service-card__button")
let dialog = document.querySelector(".dialog__content")

triggers.forEach(trigger => {
    trigger.addEventListener("click", async () => {
        let res = await fetch(`/api/services/${trigger.dataset.serviceId}`)
        let data = await res.json()

        openDialog(data.data)
    })
})

export const openDialog = data => {
    console.log(data)

    MicroModal.show("details-dialog",{
        openClass: "is-open",
        disableScroll: true
    })

    let { attributes, relationships } = data
    
    dialog.innerHTML = `
        <header class="dialog__header">
            <h2 class="dialog__name">${attributes.name}</h2>
            <p class="dialog__description">${attributes.description}</p>
            ${attributes.how_to_contact ? `<p class="dialog__description">${attributes.how_to_contact}</p>` : ""}
            ${attributes.url ? `<a href="${attributes.url}" class="button">Visit website</a>` : ""}
        </header>
        <ul class="dialog__key-points">
            ${attributes.key_point_1 ? `<li class="dialog__key-point">${attributes.key_point_1}</li>` : ""} 
            ${attributes.key_point_2 ? `<li class="dialog__key-point">${attributes.key_point_2}</li>` : ""} 
            ${attributes.key_point_3 ? `<li class="dialog__key-point">${attributes.key_point_3}</li>` : ""} 
        </ul>
        <footer class="dialog__footer">
            <aside class="dialog__subsection">
                <h3 class="dialog__subsection-title">Where</h3>
                ${attributes.street_address ? `<p>${attributes.street_address}</p>` : ""} 
                ${attributes.postcode ? `
                    <p>${attributes.postcode}</p>
                    <p><a href="https://maps.google.com/maps/search/${attributes.postcode}">Get directions</a></p>
                ` : ""} 
            </aside>
            <aside class="dialog__subsection">
                <h3 class="dialog__subsection-title">Contact</h3>
                ${attributes.email ? `<p><a href="mailto:${attributes.email}">${attributes.email}</a></p>` : ""} 
                ${attributes.phone ? `<p>${attributes.phone}</p>` : ""} 
            </aside>
        </footer>
        ${attributes.postcode ? `
            <a href="https://maps.google.com/maps/search/${attributes.postcode}" class="dialog__map-link">
                <img class="dialog__map" src="https://maps.googleapis.com/maps/api/staticmap?key=${process.env.GOOGLE_CLIENT_KEY}&size=800x250&markers=${attributes.latitude},${attributes.longitude}" alt=""/>
            </a>
        ` : ""}
    `
}