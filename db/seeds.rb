puts "⏰ Deleting existing data..."

Category.destroy_all
Service.destroy_all

Category.create([
    {
        long_name: "Groceries and cooked meals", 
        name: "food"
    },
    {
        long_name: "Dog walking", 
        name: "pets"
    },
    {
        long_name: "Staying social", 
        name: "social"
    },
    {
        long_name: "Financial support", 
        name: "financial"
    },
    {
        long_name: "Book drops and entertainment", 
        name: "entertainment"
    },
    {
        long_name: "Prescription pickups", 
        name: "prescriptions"
    },
    {
        long_name: "Physical and mental wellbeing", 
        name: "wellbeing"
    }
])

puts "✅ Created #{Category.all.count} mock categories"

75.times do
    Service.create(
        name: FFaker::Company.name,
        description: FFaker::Lorem.paragraph,

        street_address: FFaker::AddressUK.street_address,
        postcode: ["S10 1UB", "W10 4AG", "NW10 3LL", "B33 8PH", "W1A 6US"].sample,

        url: FFaker::Internet.http_url,
        email: FFaker::Internet.email,
        phone: FFaker::PhoneNumber.phone_number,

        key_point_1: FFaker::Lorem.phrase,
        key_point_2: FFaker::Lorem.phrase,
        key_point_3: FFaker::Lorem.phrase,

        how_to_contact: FFaker::Lorem.phrase,

        recommended: [false, false, false, false, false, true].sample,
        
        published: true,
        categories: [ Category.order("RANDOM()").first ]
    )
end

puts "✅ Created #{Service.all.count} mock services"