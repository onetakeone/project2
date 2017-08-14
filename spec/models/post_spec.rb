require "rails_helper"

describe Post do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:title).is_at_most(150) }
    it { should validate_length_of(:body).is_at_most(4000) }
  end

  describe "associations" do
    it { should have_many(:comments) }
    it { should belong_to(:user) }
  end

  describe "#random_test" do
    it "returns title" do
      user = create :user
      post = create(:post, title: 'avx', user: user)
      expect(post.subject).to eq 'avx'
    end
  end  
end


