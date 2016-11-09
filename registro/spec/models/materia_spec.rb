require 'rails_helper'

describe Materia do

  it "has a valid factory" do
    expect(FactoryGirl.build(:materia)).to be_valid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:materia2)).to be_invalid
  end


end
