require 'spec_helper'

describe Relationship do

  it { should belong_to(:follower) }
  it { should belong_to(:followed) }

  it { should validate_presence_of(:follower_id) }
  it { should validate_presence_of(:followed_id) }

  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }
  
  let(:active_relationship) { FactoryGirl.create(:relationship, follower: follower, followed: followed)}

  it "should be valid" do
    expect(active_relationship).to be_valid
  end
end
