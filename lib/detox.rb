# coding: utf-8
require "active_model"
require "active_support/i18n"
require "detox/validations/ordering"
require "detox/validations/possession"
require "detox/validations/all"
require "detox/validations/any"

ActiveModel::Validations.__send__(:include, Detox::Validations)
I18n.load_path << Dir[Pathname.new(File.dirname(__FILE__)).join("detox", "locales", "*.yml")]

