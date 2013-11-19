class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      cpf = ValidaDocs::CnpjCpf::Cpf.new(value)
      record.errors.add(attribute, :invalid) if not cpf.valid?
    end
  end
end
