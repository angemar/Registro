require 'rails_helper'

describe Voto do

  it "has a valid factory" do
    expect(FactoryGirl.build(:voto)).to be_valid
  end

  it "is invalid without valore" do
    expect(FactoryGirl.build(:voto2)).to be_invalid
  end

  it "is invalid without data" do
    expect(FactoryGirl.build(:voto3)).to be_invalid
  end 


end
