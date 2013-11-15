# coding: utf-8
require "detox/array_validity"

module Detox::Validations
  class PossessionValidator < ActiveModel::EachValidator
    include Detox::ArrayValidity

    ERROR_MESSAGE = ":target must be supplied".freeze

    def validate_each(record, attribute, value)
      args = { :record => record,
               :attribute => attribute,
               :value => value,
               :message => options[:message] || :possession,
               :options => options.merge(:target => [options[:target]].flatten.join(", ")) }

      validate_values(args)
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

