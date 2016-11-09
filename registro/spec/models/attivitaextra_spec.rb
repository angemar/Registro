require 'rails_helper'

describe Attivitaextra do

  it "has a valid factory" do
    expect(FactoryGirl.build(:attivitaextra)).to be_valid
  end

  it "is invalid without luogo" do
    expect(FactoryGirl.build(:attivitaextra2)).to be_invalid
  end

  it "is invalid without data inizio and data fine" do
    expect(FactoryGirl.build(:attivitaextra3)).to be_invalid
  end 


end
