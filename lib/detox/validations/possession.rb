# coding: utf-8
require "detox/array_validity"

module Detox::Validations
  class PossessionValidator < ActiveModel::EachValidator
    include Detox::ArrayValidity

    ERROR_MESSAGE = ":target must be supplied".freeze

    def validate_each(record, attribute, value)
      values = convert_to_validatee(value, options.slice(*Detox::ArrayValidity::RESERVED_OPTIONS))
      return if values.blank?

      unless values_valid?(values)
        message = options[:message] || :possession
        record.errors.add(attribute, message, options.merge(:target => [options[:target]].flatten.join(", ")))
      end
    end

    def check_validity!
      raise ArgumentError, ERROR_MESSAGE if options[:target].blank?
    end

    private
    def values_valid?(values)
      [options[:target]].flatten.all? { |t| values.include?(t) }
    end
  end
end

