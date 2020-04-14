require 'rails_helper'

RSpec.describe Category, type: :model do

    describe 'associations' do
        it { is_expected.to have_and_belong_to_many(:services) }
    end
    
    it "is not valid without a name" do
        expect(Category.new).to_not be_valid 
        expect(Category.new(name: "Test category")).to be_valid
    end

    it "gives a humanised label if an explicit long_name is not set" do
        category = Category.create({
            name: "test"
        })
        expect(category.label).to eq("Test")
    end

end