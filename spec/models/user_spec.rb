require "rails_helper"

describe User do
  describe "validations" do
    it { should validate_presence_of(:username) }
  end

  describe "associations" do
    it { should have_many(:posts) }
    it { should have_many(:places) }
  end
end