# coding: utf-8
require "active_support/core_ext"
require "detox/array_validity"
require "detox/validity_broker"

unless defined?(ActiveModel::Validations::AbsenceValidator)
  require "active_model/validations/absence"
end

ignore_constants =  [:ConfirmationValidator, :WithValidator]
validators_source = ActiveModel::Validations.constants.each_with_object("") do |const, src|
  next if ignore_constants.include?(const)
  next if Detox::Validations.constants.include?("All#{const}".to_sym)

  src << <<-EOS
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
end

Detox::Validations.module_eval(validators_source)

