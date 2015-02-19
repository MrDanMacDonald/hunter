require 'spec_helper'

describe Post do
  it { should belong_to(:user) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }

  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:description) }
end
