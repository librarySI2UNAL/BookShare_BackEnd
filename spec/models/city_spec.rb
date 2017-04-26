require 'rails_helper'

# Test suite for City model
RSpec.describe City, type: :model do
  # Association test
  # Validation tests
  it { should validate_presence_of(:place_id) }
  it { should validate_uniqueness_of(:place_id) }
  it { should validate_presence_of(:name) }
end