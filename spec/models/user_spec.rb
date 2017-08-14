require "rails_helper"

describe User do
  describe "presence" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
  end

  describe "associations" do
    it { should have_many(:posts) }
    it { should have_many(:places) }
  end

  describe "uniqueness" do
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

end