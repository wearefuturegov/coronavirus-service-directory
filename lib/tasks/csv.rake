require 'csv'

task :csv => :environment do

    puts "📡 Fetching remote data source..."

    response = HTTParty.get(ENV["DATASOURCE"])
    rows = CSV.parse(response.body, headers: true)

    puts "🙇‍ Processing and geocoding #{rows.length} rows..."

    Category.destroy_all
    Service.destroy_all

    rows.drop(3).each do |row|
        service = Service.new

        service.name = row[0]
        service.description = row[1]
        
        if row[2] && row[2].downcase.strip == "yes"
            service.categories << Category.find_or_create_by(name: "food")
        end
        if row[3] && row[3].downcase.strip == "yes"
            service.categories << Category.find_or_create_by(name: "pets")
        end
        if row[4] && row[4].downcase.strip == "yes"
            service.categories << Category.find_or_create_by(name: "social")
        end
        if row[5] && row[5].downcase.strip == "yes"
            service.categories << Category.find_or_create_by(name: "financial")
        end
        if row[6] && row[6].downcase.strip == "yes"
            service.categories << Category.find_or_create_by(name: "entertainment")
        end
        if row[7] && row[7].downcase.strip == "yes"
            service.categories << Category.find_or_create_by(name: "prescriptions")
        end
        if row[8] && row[8].downcase.strip == "yes"
            service.categories << Category.find_or_create_by(name: "wellbeing")
        end

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

        service.published = true

        if service.save
            puts "Added #{service.name}"
        else
            puts "ERROR"
        end
    end

    puts "✅ Finished"
end