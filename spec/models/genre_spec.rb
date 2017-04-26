require 'rails_helper'

# Test suite for Genre model
RSpec.describe Genre, type: :model do
  # Association test
  it {should have_and_belong_to_many(:interests) }
  # Validation tests
  it { should validate_presence_of(:name) }
end