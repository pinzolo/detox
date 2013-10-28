# coding: utf-8
require "active_model"

# Not use ActiveModel::Model for support ActiveModel 3.2.x
class ModelBase
  extend  ActiveModel::Naming
  extend  ActiveModel::Translation
  include ActiveModel::Validations
  include ActiveModel::Conversion

end
