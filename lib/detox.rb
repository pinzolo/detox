# coding: utf-8
require "active_model"
require "active_support/i18n"
require "detox/ordering"

ActiveModel::Validations.__send__(:include, Detox)
I18n.load_path << Dir[Pathname.new(File.dirname(__FILE__)).join("detox", "locales", "*.yml")]
