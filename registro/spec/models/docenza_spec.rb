require 'rails_helper'

describe Docenza do

  it "has a valid factory" do
    expect(FactoryGirl.build(:docenza)).to be_valid
  end

  it "is invalid with shorter cf" do
    expect(FactoryGirl.build(:docenza2)).to be_invalid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:docenza3)).to be_invalid
  end 


end
