# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Service.destroy_all

Service.create([
    {
        name: "Example service",
        description: "Eventually, you do plan to have dinosaurs on your dinosaur tour, right? Jaguar shark! So tell me - does it really exist? I was part of something special. Hey, take a look at the earthlings. Goodbye! So you two dig up, dig up dinosaurs? Yes, Yes, without the oops!",
        key_point_1: "24/7 deliveries",
        key_point_2: "Good for older people",
        key_point_3: "Has an active social media presence",
        category: ["social", "food"],
        url: "#",
        postcode: "B33 8PP",
        latitude: 52.4775002727685,
        longitude: -1.8093153042122
    },
    {
        name: "Second example service",
        description: "Goodbye! So you two dig up, dig up dinosaurs? Yes, Yes, without the oops!",
        key_point_1: "24/7 deliveries",
        key_point_2: "Good for older people",
        key_point_3: "Has an active social media presence",
        category: ["social"],
        phone: "0777 777 7777",
        postcode: "B33 8PP",
        latitude: 52.4775002727685,
        longitude: -1.8093153042122
    },

    {
        name: "Third example service",
        description: "Jaguar shark! So tell me - does it really exist? I was part of something special. Hey, take a look at the earthlings. Goodbye! So you two dig up.",
        key_point_1: "24/7 deliveries",
        key_point_2: "Good for older people",
        key_point_3: "Has an active social media presence",
        category: ["social"],
        url: "#",
        phone: "0777 777 7777",
        postcode: "s10 2ll",
        latitude: 53.3733359351992,
        longitude: -1.50328085336585
    },
])
