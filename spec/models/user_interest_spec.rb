require 'rails_helper'

# Test suite for UserInterest model
RSpec.describe UserInterest, type: :model do
  # Association test
  it {should belong_to(:user)}
  it {should belong_to(:interest)}
  # Validation tests
end