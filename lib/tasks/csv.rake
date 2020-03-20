require 'csv'

task :csv do

    puts CSV.read("data.csv")

end