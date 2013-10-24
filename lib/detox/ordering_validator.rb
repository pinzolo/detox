# coding: utf-8
require "active_support/core_ext"

module Detox
  class OrderingValidator < ActiveModel::EachValidator
    include ArrayValidity

    def validate_each(record, attribute, value)
      values = convert_to_validatee(value, options.slice(:ignore_nil_value, :ignore_blank_value))
      return if values.blank?

      unless values_valid?(values)
        # FIXME: decide default error message
        message = options[:message] || ""
        record.errors.add(attribute, message)
      end
    end

    private
    def values_valid?(values)
      valid_numbers.map(&:to_s).sort == values.map(&:to_s).sort
    end

    def valid_numbers(length)
      last = first + length
      (first...last).to_a
    end

    def first
      num = options[:start_with].to_i
      num.zero? ? 1 : num
    end
  end
end
