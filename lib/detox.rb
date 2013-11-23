# coding: utf-8
require "active_model"
require "active_support/i18n"
require "detox/validations/ordering"
require "detox/validations/possession"
require "detox/validations/values_uniqueness"
require "detox/validations/all"
require "detox/validations/any"

ActiveModel::Validations.__send__(:include, Detox::Validations)
Dir[Pathname.new(File.dirname(__FILE__)).join("detox", "locales", "*.yml")].each do |f|
  I18n.load_path << f
end

