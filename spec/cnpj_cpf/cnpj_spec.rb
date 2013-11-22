require "spec_helper"

describe ValidaDocs::CnpjCpf::Cnpj do
  it "is invalid with malformed number" do
    ["242.2818/50001-54", "35.611.011/000192"].each do |number|
      cnpj = ValidaDocs::CnpjCpf::Cnpj.new(number)
      expect(cnpj).to_not be_valid
    end
  end

  it "is invalid with a number longer than 14" do
    ["24.228.185/0001-544", "936710360001881"].each do |number|
      cnpj = ValidaDocs::CnpjCpf::Cnpj.new(number)
      expect(cnpj).to_not be_valid
    end
  end

  it "is invalid with a number shorter than 14" do
    ["24.228.185/0001-5", "9367103600018"].each do |number|
      cnpj = ValidaDocs::CnpjCpf::Cnpj.new(number)
      expect(cnpj).to_not be_valid
    end
  end

  it "is invalid with a sequence of the same number" do
    ["11.111.111/1111-11", "22222222222222"].each do |number|
      cnpj = ValidaDocs::CnpjCpf::Cnpj.new(number)
      expect(cnpj).to_not be_valid
    end
  end

  it "is invalid with invalid check number" do
    ["04.001.155/0001-03", "85961757000101"].each do |number|
      cnpj = ValidaDocs::CnpjCpf::Cnpj.new(number)
      expect(cnpj).to_not be_valid
    end
  end

  it "is valid with correct number" do
    ["04.001.155/0001-01", "85961757000102"].each do |number|
      cnpj = ValidaDocs::CnpjCpf::Cnpj.new(number)
      expect(cnpj).to be_valid
    end
  end
end