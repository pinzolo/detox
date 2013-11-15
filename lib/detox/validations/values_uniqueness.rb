# coding: utf-8
require "active_support/core_ext"
require "detox/array_validity"

module Detox::Validations
  class ValuesUniquenessValidator < ActiveModel::EachValidator
    include Detox::ArrayValidity

    def validate_each(record, attribute, value)
      args = { :record => record,
               :attribute => attribute,
               :value => value,
               :message => options[:message] || :values_not_unique,
               :options => options }

      validate_values(args)
    end

    private
    def values_valid?(values)
      values.uniq.length == values.length
    end
  end
end

