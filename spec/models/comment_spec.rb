require "rails_helper"

describe Comment do
  it { should validate_presence_of(:content) }
  it { should validate_length_of(:content).is_at_most(4000) }  
  it { should belong_to(:commentable) }
end