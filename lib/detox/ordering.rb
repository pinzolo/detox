# coding: utf-8
require "active_support/core_ext"
require "detox/array_validity"

module Detox
  class OrderingValidator < ActiveModel::EachValidator
    include Detox::ArrayValidity

    def validate_each(record, attribute, value)
      values = convert_to_validatee(value, options.slice(:ignore_nil_value, :ignore_blank_value))
      return if values.blank?

      unless values_valid?(values)
        message = options[:message] || :invalid_as_order
        record.errors.add(attribute, message)
      end
    end

    private
    def values_valid?(values)
      valid_numbers(values.length).map(&:to_s).sort == values.map(&:to_s).sort
    end

    def valid_numbers(length)
      last_number = first_number + length
      (first_number...last_number).to_a
    end

    def first_number
      num = options[:start_with].to_i
      num.zero? ? 1 : num
    end
  end
end