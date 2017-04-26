require 'rails_helper'

# Test suite for InterestGenre model
RSpec.describe InterestGenre, type: :model do
  # Association test
  it {should belong_to(:interest)}
  it {should belong_to(:genre)
  # Validation tests
end