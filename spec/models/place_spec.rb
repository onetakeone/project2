require "rails_helper"

describe Place do
  describe "validations" do
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_most(1000) }  

    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(50) }  

    it { should validate_presence_of(:address) }
    it { should validate_length_of(:address).is_at_most(150) } 
  end

  describe "associations" do
   it { should have_many(:comments) }
   it { should belong_to(:user) }
 end
end