# coding: utf-8
require "active_model"
require "detox/ordering_validator"

ActiveModel::Validations.__send__(:include, Detox)
