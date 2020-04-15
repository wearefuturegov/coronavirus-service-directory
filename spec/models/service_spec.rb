require 'rails_helper'

RSpec.describe Service, type: :model do

    before(:all) do 
        Geocoder.configure(:lookup => :test)
        Geocoder::Lookup::Test.add_stub(
        "W1A 6US", [
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

    describe 'associations' do
        it { is_expected.to have_and_belong_to_many(:categories) }
    end
    
    it "is not valid without a name, description and contact detail" do
        expect(build(:service)).to be_valid
        expect(build(:service, email: nil, url: nil, phone: nil)).to_not be_valid
    end

    it "needs a caretaker contact details if submitted by the public" do
        expect(build(:service, attribution: "Public submission")).to_not be_valid
        expect(build(:service, attribution: "Public submission", caretaker_email: "example@test.com")).to be_valid
    end

    # it "it shouldn't be published by default" do
    #     expect(create(:service).published).to be(false)
    # end

    it "geocodes from a postcode" do
        service = create(:service, postcode: "W1A 6US")
        expect(service.latitude).to_not be_nil
        expect(service.longitude).to_not be_nil
    end

end