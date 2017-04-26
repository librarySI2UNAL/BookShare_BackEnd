require 'rails_helper'

# Test suite for Comment model
RSpec.describe Comment, type: :model do
  # Association test
  it {should belong_to(:user)}
  # Validation tests
  it { should validate_presence_of(:comment) }
end