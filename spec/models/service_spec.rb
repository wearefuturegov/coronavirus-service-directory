require 'rails_helper'

RSpec.describe "Service", type: :model do
    
    it "is not valid without a name" do
        expect(Service.new).to_not be_valid 
        expect(Service.new(name: "Test service")).to be_valid
    end

    it "it shouldn't be published by default" do
        service = Service.create(name: "Test")
        expect(service.published).to be(false)
    end

    it "geocodes from a postcode" do
        service = Service.create({
            name: "Test service",
            postcode: "B33 8PP"
        })
        expect(service.latitude).to_not be_nil
        expect(service.longitude).to_not be_nil
    end

end