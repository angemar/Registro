require 'rails_helper'

describe Compito do

  it "has a valid factory" do
    expect(FactoryGirl.build(:compito)).to be_valid
  end

  it "is invalid with shorter cf" do
    expect(FactoryGirl.build(:compito2)).to be_invalid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:compito3)).to be_invalid
  end 


end
