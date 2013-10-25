# coding: utf-8
require "test_class/model_base"

class AllPresenceTest < ModelBase
  attr_accessor :values

  validates :values, :all_presence => true
end

