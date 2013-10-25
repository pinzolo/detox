# coding: utf-8
require "detox/temporary_validity_holder"

module Detox
  class AllPresenceValidator < ActiveModel::EachValidator
    include Detox::ArrayValidity

    def validate_each(record, attribute, value)
      values = convert_to_validatee(value, options.slice(:ignore_nil_value, :ignore_blank_value))
      return if values.blank?

      validator = ActiveModel::Validations::PresenceValidator.new(options.dup.merge(:attributes => attribute))
      holder = TemporaryValidityHolder.new
      validity = values.all? do |v|
        validator.validate_each(holder, attribute, v)
        holder.valid?
      end
      unless validity
        message = options[:message] || :all_presence
        record.errors.add(attribute, message)
      end
    end
  end

#require "active_support/core_ext"
#consts = (ActiveModel::Validations.constants - Detox.constants - [:WithValidator]).select do |c|
#  const = "ActiveModel::Validations::#{c}".safe_constantize
#  const.is_a?(Class) && const.ancestors.include?(ActiveModel::EachValidator)
#end
#p consts
end
