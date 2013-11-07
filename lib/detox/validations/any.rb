# coding: utf-8
require "active_support/core_ext"
require "detox/array_validity"
require "detox/validity_broker"

ignore_constants =  [:ConfirmationValidator, :WithValidator]
defined_validators = Detox::Validations.constants
src = ""
ActiveModel::Validations.constants.each do |const|
  next if ignore_constants.include?(const)
  base_validator = "ActiveModel::Validations::#{const}".safe_constantize
  next unless base_validator.ancestors.include?(ActiveModel::EachValidator)
  next if defined_validators.include?("Any#{const}".to_sym)

  define_validator_src = <<-EOS
  class Any#{const} < ActiveModel::EachValidator
    include Detox::ArrayValidity

    def check_validity!
      if (options[:min_valid_count] != nil && !options[:min_valid_count].is_a?(Integer)) ||
         (options[:max_valid_count] != nil && !options[:max_valid_count].is_a?(Integer)) ||
         (options[:min_valid_count] != nil && options[:min_valid_count] <= 0) ||
         (options[:max_valid_count] != nil && options[:max_valid_count] <= 0)
        raise ArgumentError, ":min_valid_count and :max_valid_count must be a positive integer ( greater than 0 ) or nil"
      end
      if options[:min_valid_count] != nil && options[:max_valid_count] != nil && options[:min_valid_count] > options[:max_valid_count]
        raise ArgumentError, ":min_valid_count must be less than :max_valid_count"
      end
    end

    def validate_each(record, attribute, value)
      values = convert_to_validatee(value)
      return if values.blank?

      new_options = options.dup.merge(:attributes => [attribute])
      validator = ActiveModel::Validations::#{const}.new(new_options)
      broker = Detox::ValidityBroker.new
      valid_count = values.count do |v|
        broker.validatee = v
        validator.validate(broker)
        broker.valid?
      end

      unless count_valid?(valid_count)
        message = options[:message] || :any_#{const.to_s.underscore.gsub(/_validator\z/, "")}
        record.errors.add(attribute, message, { :min_valid_count => 1, :max_valid_count => "" }.merge(options))
      end
    end

    private
    def count_valid?(valid_count)
      (options[:min_valid_count] || 1) <= valid_count &&
        (options[:max_valid_count].nil? || valid_count <= options[:max_valid_count])
    end
  end
EOS
  src << define_validator_src
end

Detox::Validations.module_eval(src)

