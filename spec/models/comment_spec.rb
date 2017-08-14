require "spec_helper"
require "rails_helper"

describe Comment do
  it { should validate_presence_of :comment }
end