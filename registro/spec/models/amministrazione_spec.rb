require 'rails_helper'

describe Amministrazione do

  it "has a valid factory" do
    expect(FactoryGirl.build(:amministrazione)).to be_valid
  end

  it "is invalid without titolo" do
    expect(FactoryGirl.build(:amministrazione2)).to be_invalid
  end



end
