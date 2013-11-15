# coding: utf-8
require "active_support/core_ext"
require "detox/array_validity"

module Detox::Validations
  class OrderingValidator < ActiveModel::EachValidator
    include Detox::ArrayValidity

    def validate_each(record, attribute, value)
      args = { :record => record,
               :attribute => attribute,
               :value => value,
               :message => options[:message] || :invalid_as_order,
               :options => options }

      validate_values(args)
    end

    private
    def values_valid?(values)
      same_values?(valid_numbers(values.length), values)
    end

    def same_values?(values, another)
      normalize_values_for_compare(values) == normalize_values_for_compare(another)
    end

    def valid_numbers(length)
      last_number = first_number + length
      (first_number...last_number).to_a
    end

    def first_number
      num = options[:start_with].to_i
      num.zero? ? 1 : num
    end

    def normalize_values_for_compare(values)
      values.map(&:to_s).sort
    end
  end
end
