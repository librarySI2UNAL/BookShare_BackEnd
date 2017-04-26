require 'rails_helper'

# Test suite for Book model
RSpec.describe Book, type: :model do
  # Association test
  it { should have_many(:products).through(:product_item) }
  it { should belong_to(:genre) }
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:genre) }
  it { should validate_presence_of(:editorial) }
  it { should validate_presence_of(:year_of_publication) }
end