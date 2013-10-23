# coding: utf-8
require "active_support/core_ext"

module Detox
  module ValuesExtractable
    def extract_values(data, options = {})
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
      values = values.reject { |v| v.blank? } if options[:ignore_blank_value]
      values
    end
  end
end
