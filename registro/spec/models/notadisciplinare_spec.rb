require 'rails_helper'

describe Notadisciplinare do

  it "has a valid factory" do
    expect(FactoryGirl.build(:notadisciplinare)).to be_valid
  end

  it "is valid without oggetto" do
    expect(FactoryGirl.build(:notadisciplinare2)).to be_valid
  end

  it "is invalid without data" do
    expect(FactoryGirl.build(:notadisciplinare3)).to be_invalid
  end 


end
