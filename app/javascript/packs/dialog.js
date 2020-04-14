import MicroModal from "micromodal"

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

        openDialog(data)
    })
})

export const openDialog = data => {
    MicroModal.show("details-dialog",{
        openClass: "is-open",
        disableScroll: true
    })
    
    dialog.innerHTML = `
        <header class="dialog__header">
            <h2 class="dialog__name">${data.name}</h2>
            <p class="dialog__description">${data.description}</p>
            ${data.url ? `<a href="${data.url}" class="button">Visit website</a>` : ""}
        </header>
        <ul class="dialog__key-points">
            ${data.key_point_1 ? `<li class="dialog__key-point">${data.key_point_1}</li>` : ""} 
            ${data.key_point_2 ? `<li class="dialog__key-point">${data.key_point_2}</li>` : ""} 
            ${data.key_point_3 ? `<li class="dialog__key-point">${data.key_point_3}</li>` : ""} 
        </ul>
        <footer class="dialog__footer">
            <aside class="dialog__subsection">
                <h3 class="dialog__subsection-title">Where</h3>
                ${data.street_address ? `<p>${data.street_address}</p>` : ""} 
                ${data.postcode ? `
                    <p>${data.postcode}</p>
                    <p><a href="https://maps.google.com/search/${data.postcode}">Get directions</a></p>
                ` : ""} 
            </aside>
            <aside class="dialog__subsection">
                <h3 class="dialog__subsection-title">Contact</h3>
                ${data.email ? `<p><a href="mailto:${data.email}">${data.email}</a></p>` : ""} 
                ${data.phone ? `<p>${data.phone}</p>` : ""} 
            </aside>
        </footer>
        ${data.postcode ? `
            <a href="https://maps.google.com/search/${data.postcode}" class="dialog__map-link">
                <img class="dialog__map" src="https://maps.googleapis.com/maps/api/staticmap?key=${process.env.GOOGLE_CLIENT_KEY}&size=800x250&markers=${data.latitude},${data.longitude}" alt=""/>
            </a>
        ` : ""}
    `
}