# coding: utf-8
require "active_support/core_ext"

module Detox
  module ArrayValidity
    RESERVED_OPTIONS = [:ignore_nil_value, :ignore_blank_value].freeze

    def convert_to_validatee(data, options = {})
      values = if data.nil?
                 []
               elsif data.is_a?(Array)
                 data.dup
               elsif data.is_a?(Hash)
                 data.values
               else
                 [data]
               end
      values = values.compact if options[:ignore_nil_value]
      values = values.reject(&:blank?) if options[:ignore_blank_value]
      values
    end
  end
end
