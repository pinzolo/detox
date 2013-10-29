# coding: utf-8
require "test_class/model_base"

class AllAbsenceTest < ModelBase
  attr_accessor :values

  validates :values, :all_absence => true
end

class AllAbsenceTestWithMessageOption < ModelBase
  attr_accessor :values

  validates :values, :all_absence => { :message => "is invalid" }
end
