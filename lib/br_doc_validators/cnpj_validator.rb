class CnpjValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      cnpj = ValidaDocs::CnpjCpf::Cnpj.new(value)
      record.errors.add(attribute, :invalid) if not cnpj.valid?
    end
  end
end
