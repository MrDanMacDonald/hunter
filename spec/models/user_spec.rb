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

  it { should respond_to(:follow) }
  it { should respond_to(:unfollow) }

  let(:user) { FactoryGirl.create(:user) }
  let(:other_user) { FactoryGirl.create(:user) }

  it "should be valid" do
    expect(user).to be_valid
  end

  it "should follow a user" do
    user.follow(other_user)
    expect(user.following?(other_user)).to eq true
    expect(other_user.followers.include?(user)).to eq true
  end

  it "should unfollow a user" do
    user.follow(other_user)
    user.unfollow(other_user)
    expect(user.following?(other_user)).to eq false
  end

end
