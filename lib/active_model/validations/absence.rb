# coding: utf-8

# via: activemodel/lib/active_model/validations/absence.rb (4.0-stable)
#      https://github.com/rails/rails/blob/4-0-stable/activemodel/lib/active_model/validations/absence.rb
module ActiveModel
  module Validations
    class AbsenceValidator < EachValidator
      def validate_each(record, attr_name, value)
        record.errors.add(attr_name, :present, options) if value.present?
      end
    end

    module HelperMethods
      def validates_absence_of(*attr_names)
        validates_with AbsenceValidator, _merge_attributes(attr_names)
      end
    end
  end
end
