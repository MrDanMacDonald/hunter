require 'spec_helper'

describe User do
  it { should have_many(:posts) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
end
