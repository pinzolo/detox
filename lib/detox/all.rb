# coding: utf-8
require "detox/validity_broker"

module Detox
  class AllPresenceValidator < ActiveModel::EachValidator
    include Detox::ArrayValidity

    def validate_each(record, attribute, value)
      values = convert_to_validatee(value, options.slice(*ArrayValidity::RESERVED_OPTIONS))
      return if values.blank?

      new_options = options.dup.except(*ArrayValidity::RESERVED_OPTIONS).merge(:attributes => [attribute])
      validator = ActiveModel::Validations::PresenceValidator.new(new_options)
      broker = ValidityBroker.new
      validity = values.all? do |v|
        broker.validatee = v
        validator.validate(broker)
        broker.valid?
      end
      unless validity
        message = options[:message] || :all_presence
        record.errors.add(attribute, message)
      end
    end
  end

  class AllFormatValidator < ActiveModel::EachValidator
    include Detox::ArrayValidity

    def validate_each(record, attribute, value)
      values = convert_to_validatee(value, options.slice(*ArrayValidity::RESERVED_OPTIONS))
      return if values.blank?

      new_options = options.dup.except(*ArrayValidity::RESERVED_OPTIONS).merge(:attributes => [attribute])
      validator = ActiveModel::Validations::FormatValidator.new(new_options)
      broker = ValidityBroker.new
      validity = values.all? do |v|
        broker.validatee = v
        validator.validate(broker)
        broker.valid?
      end
      unless validity
        message = options[:message] || :all_format
        record.errors.add(attribute, message)
      end
    end
  end
end

unless defined?(ActiveModel::Validations::AbsenceValidator)
  require "active_model/validations/absence"
end

#require "active_support/core_ext"
#ignore_constants =  [:WithValidator]
#consts = (ActiveModel::Validations.constants - ignore_constants).select do |c|
#  const = "ActiveModel::Validations::#{c}".safe_constantize
#  const.ancestors.include?(ActiveModel::EachValidator)
#end
#p consts

