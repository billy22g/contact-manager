require 'spec_helper'

describe Company do
  let(:basedirectory) { Company.create(name: "BaseDirectory.com") }

  it "is valid" do
    expect(basedirectory).to be_valid
  end

  it "is invalid without a name" do 
    basedirectory.name = nil
    expect(basedirectory).not_to be_valid
  end
end
