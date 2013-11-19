# PhoneValidator makes phone validation natural for ActiveModel object. Validation using global_phone.
class PhoneValidator < ActiveModel::EachValidator
  @@default_options = {}

  def self.default_options
    @@default_options
  end

  def validate_each(record, attribute, value)
    options = @@default_options.merge(self.options)

    unless GlobalPhone.validate(value)
      record.errors.add(attribute, options[:message] || :invalid)
    end
  end
end