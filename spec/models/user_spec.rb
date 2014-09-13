require 'spec_helper'

describe User do
  it { should have_many(:collections) }
  it { should have_many(:monuments) }
  it { should validate_presence_of(:email) }
end
