require 'rails_helper'

# Test suite for Product model
RSpec.describe Product, type: :model do
  # Association test
  it { should belong_to(:product_item) }
  it { should belong_to(:user) }
  it { should have_many(:photos) }
  it { should have_many(:comments) }
  # Validation tests
  it { should validate_presence_of(:special) }
  it { should validate_presence_of(:available) }
  it { should validate_presence_of(:cover) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:value) }
  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:code_type) }
end