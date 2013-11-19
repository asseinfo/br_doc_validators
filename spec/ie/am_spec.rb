require "spec_helper"

describe ValidaDocs::IE::AM do
  it "is invalid with malformed number" do
    ["8.535.410-60", "884.67.826-1", "13.BA9.093-6"].each do |number|
      ie = ValidaDocs::IE::AM.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with length different to 9" do
    ["1234567", "12345678901"].each do |number|
      ie = ValidaDocs::IE::AM.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is invalid with invalid check number" do
    ["500085276", "886770232"].each do |number|
      ie = ValidaDocs::IE::AM.new(number)
      expect(ie).to_not be_valid
    end
  end

  it "is valid with valid number" do
    ["425721221", "310636396"].each do |number|
      ie = ValidaDocs::IE::AM.new(number)
      expect(ie).to be_valid
    end
  end
end
