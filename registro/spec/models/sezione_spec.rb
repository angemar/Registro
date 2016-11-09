require 'rails_helper'

describe Sezione do

  it "has a valid factory" do
    expect(FactoryGirl.build(:sezione)).to be_valid
  end

  it "is invalid without number" do
    expect(FactoryGirl.build(:sezione2)).to be_invalid
  end

  it "is invalid without lettera" do
    expect(FactoryGirl.build(:sezione3)).to be_invalid
  end 


end
