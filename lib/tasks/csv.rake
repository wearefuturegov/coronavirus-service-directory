require 'csv'

task :csv => :environment do
    Service.destroy_all

    response = HTTParty.get(ENV["DATASOURCE"])
    rows = CSV.parse(response.body, headers: true)

    rows.drop(3).each do |row|
        service = Service.new

        service.name = row[0]
        service.description = row[1]

        categories = []
        if row[2] == "Yes"
            categories.push("food")
        end
        if row[3] == "Yes"
            categories.push("pets")
        end
        if row[4] == "Yes"
            categories.push("social")
        end
        if row[5] == "Yes"
            categories.push("financial")
        end
        if row[6] == "Yes"
            categories.push("entertainment")
        end
        if row[7] == "Yes"
            categories.push("prescription")
        end
        if row[8] == "Yes"
            categories.push("wellbeing")
        end
        service.category = categories

        service.url = row[9]
        service.phone = row[10]
        service.email = row[11]
        service.postcode = row[12]
        # ...
        service.recommended = row[15]
        service.key_point_1 = row[16]
        service.key_point_2 = row[17]
        service.key_point_3 = row[18]
        service.how_to_contact = row[19]

        service.save
    end
end