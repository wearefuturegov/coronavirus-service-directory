require 'rails_helper'

RSpec.describe "Service", type: :model do

    before(:all) do 
        Geocoder.configure(:lookup => :test)
        Geocoder::Lookup::Test.add_stub(
        "B33 8PP", [
          {
            'latitude'     => 40.7143528,
            'longitude'    => -74.0059731,
            'address'      => 'New York, NY, USA',
            'state'        => 'New York',
            'state_code'   => 'NY',
            'country'      => 'United States',
            'country_code' => 'US'
          }
         ]
        )
    end
    
    it "is not valid without a name" do
        expect(Service.new).to_not be_valid 
        expect(Service.new(
            name: "Test service",
            description: "Test",
            phone: "07777777777",
            caretaker_phone: "07777777777"
        )).to be_valid
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