require "rails_helper"

describe Order do
  it { should validate_presence_of(:phone) }
  it { should validate_length_of(:phone).is_at_most(15) }  
end