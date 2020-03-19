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
        key_points: [
            "24/7 deliveries",
            "Good for older people",
            "Has an active social media presence"
        ],
        category: ["social", "food"],
        url: "#"
    },
    {
        name: "Second example service",
        description: "Goodbye! So you two dig up, dig up dinosaurs? Yes, Yes, without the oops!",
        key_points: [
            "24/7 deliveries",
            "Good for older people",
            "Has an active social media presence"
        ],
        category: ["social"],
        phone: "0777 777 7777"
    },

    {
        name: "Third example service",
        description: "Jaguar shark! So tell me - does it really exist? I was part of something special. Hey, take a look at the earthlings. Goodbye! So you two dig up.",
        key_points: [
            "24/7 deliveries",
            "Good for older people",
            "Has an active social media presence"
        ],
        category: ["social"],
        url: "#",
        phone: "0777 777 7777"
    },
])