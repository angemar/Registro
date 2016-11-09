require 'rails_helper'

describe Alunno do

  it "has a valid factory" do
    expect(FactoryGirl.build(:alunno)).to be_valid
  end

  it "is invalid with shorter cf" do
    expect(FactoryGirl.build(:alunno2)).to be_invalid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:alunno3)).to be_invalid
  end 


end
