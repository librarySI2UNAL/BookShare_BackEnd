require 'rails_helper'

# Test suite for User model
RSpec.describe User, type: :model do
  # Association test
  it {should belong_to(:city)}
  it {should belong_to(:photo).with_message(:optional)}
  it {should have_and_belong_to_many(:interests) }
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_format_of(:email).with(Devise::email_regexp)}
  it { should validate_presence_of(:qualification) }
end