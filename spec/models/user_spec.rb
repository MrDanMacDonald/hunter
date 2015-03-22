require 'spec_helper'

describe User do
  it { should have_many(:posts) }
  it { should have_many(:comments) }
  it { should have_many(:active_relationships) }


  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:photo) }
  it { should respond_to(:title) }
  it { should respond_to(:provider) }
  it { should respond_to(:description) }
  it { should respond_to(:location) }

  let(:user) { FactoryGirl.create(:user) }

  it "should be valid" do
    expect(user).to be_valid
  end
end
