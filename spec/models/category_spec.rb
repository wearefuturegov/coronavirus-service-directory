require 'rails_helper'

RSpec.describe Category, type: :model do

    describe 'associations' do
        it { is_expected.to have_and_belong_to_many(:services) }
    end
    
    it "is not valid without a name" do
        expect(build(:category)).to be_valid 
        expect(build(:category, name: nil)).to_not be_valid 
    end

    it "gives a humanised label if an explicit long_name is not set" do
        category = create(:category)
        expect(category.label).to eq(category.name.humanize)
    end

end