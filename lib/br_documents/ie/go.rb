require_relative 'pattern1'

class BrDocuments::IE::GO < BrDocuments::IE::Pattern1
  def initialize(number)
    super
    @mask = /^(\d{2}\.\d{3}\.\d{3}\-\d{1})$|^(\d{9})$/
  end

  private

  def format_ie(number)
    number.sub(/(\d{2})(\d{3})(\d{3})(\d{1})/, '\\1.\\2.\\3-\\4')
  end
end
