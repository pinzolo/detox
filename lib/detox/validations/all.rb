# coding: utf-8
require "active_support/core_ext"
require "detox/validity_broker"

unless defined?(ActiveModel::Validations::AbsenceValidator)
  require "active_model/validations/absence"
end

ignore_constants =  [:WithValidator]
defined_validators = Detox::Validations.constants
src = ""
ActiveModel::Validations.constants.each do |const|
  next if ignore_constants.include?(const)
  base_validator = "ActiveModel::Validations::#{const}".safe_constantize
  next unless base_validator.ancestors.include?(ActiveModel::EachValidator)
  next if defined_validators.include?("Detox::All#{const}".to_sym)

  define_validator_src = <<-EOS
  class All#{const} < ActiveModel::EachValidator
    include Detox::ArrayValidity

    def validate_each(record, attribute, value)
      values = convert_to_validatee(value, options.slice(*Detox::ArrayValidity::RESERVED_OPTIONS))
      return if values.blank?

      new_options = options.dup.except(*Detox::ArrayValidity::RESERVED_OPTIONS).merge(:attributes => [attribute])
      validator = ActiveModel::Validations::#{const}.new(new_options)
      broker = Detox::ValidityBroker.new
      validity = values.all? do |v|
        broker.validatee = v
        validator.validate(broker)
        broker.valid?
      end
      unless validity
        message = options[:message] || :all_#{const.to_s.underscore.gsub(/_validator\z/, "")}
        record.errors.add(attribute, message)
      end
    end
  end
EOS
  src << define_validator_src
end

Detox::Validations.module_eval(src)

