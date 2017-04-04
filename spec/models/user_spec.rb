require 'rails_helper'

# Test suite for User model
RSpec.describe User, type: :model do
  # Association test
  ##Put validation test here
  it { should have_one(:photo) }
  it { should have_many(:products) }
  #it { should have_many(:interests) }
  # Validation tests
  # ensure name, email and password_digest are present before save
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end