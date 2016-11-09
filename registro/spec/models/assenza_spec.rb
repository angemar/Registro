require 'rails_helper'

describe Assenza do

  it "has a valid factory" do
    expect(FactoryGirl.build(:assenza)).to be_valid
  end

  it "is invalid without data" do
    expect(FactoryGirl.build(:assenza2)).to be_invalid
  end


end
