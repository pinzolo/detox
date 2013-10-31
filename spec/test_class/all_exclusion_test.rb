# coding: utf-8
require "test_class/model_base"

class AllExclusionTest < ModelBase
  attr_accessor :values

  validates :values, :all_exclusion => { :in => ["4", "5", "6" ] }
end

class AllExclusionTestWithMessageOption < ModelBase
  attr_accessor :values

  validates :values, :all_exclusion => { :in => ["4", "5", "6"], :message => "is invalid" }
end

