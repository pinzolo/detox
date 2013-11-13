# coding: utf-8
require "active_support/core_ext"
require "detox/array_validity"

module Detox::Validations
  class ValuesUniquenessValidator < ActiveModel::EachValidator
    include Detox::ArrayValidity

    def validate_each(record, attribute, value)
      values = convert_to_validatee(value, options.slice(*Detox::ArrayValidity::RESERVED_OPTIONS))
      return if values.blank?

      unless values_valid?(values)
        message = options[:message] || :values_not_unique
        record.errors.add(attribute, message)
      end
    end

    private
    def values_valid?(values)
      values.uniq.length == values.length
    end
  end
end

