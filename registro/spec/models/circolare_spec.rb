require 'rails_helper'

describe Circolare do

  it "has a valid factory" do
    expect(FactoryGirl.build(:circolare)).to be_valid
  end

  it "is invalid without titolo" do
    expect(FactoryGirl.build(:circolare2)).to be_invalid
  end



end
