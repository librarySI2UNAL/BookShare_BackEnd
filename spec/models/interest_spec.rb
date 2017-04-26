require 'rails_helper'

# Test suite for Interest model
RSpec.describe Interest, type: :model do
  # Association test
  it {should have_and_belong_to_many(:users) }
  it {should have_and_belong_to_many(:genres) }
  # Validation tests
  it { should validate_presence_of(:name) }
end