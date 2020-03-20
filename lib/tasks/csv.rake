require 'csv'

task :csv => :environment do

    Service.destroy_all

    rows = CSV.parse(File.read("data.csv"), headers: true)

    rows.drop(2).each do |row|
        service = Service.new

        service.name = row[0]
        service.description = row[1]

        service.url = row[9]
        service.phone = row[10]
        service.email = row[11]

        service.postcode = row[12]

        service.save
    end
end