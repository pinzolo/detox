# coding: utf-8
require "test_class/model_base"

class AllInclusionTest < ModelBase
  attr_accessor :values

  validates :values, :all_inclusion => { :in => ["1", "2", "3" ] }
end

class AllInclusionTestWithIgnoreNilValueOption < ModelBase
  attr_accessor :values

  validates :values, :all_inclusion => { :in => ["1", "2", "3" ], :ignore_nil_value => true }
end

class AllInclusionTestWithIgnoreBlankValueOption < ModelBase
  attr_accessor :values

  validates :values, :all_inclusion => { :in => ["1", "2", "3" ], :ignore_blank_value => true }
end

class AllInclusionTestWithMessageOption < ModelBase
  attr_accessor :values

  validates :values, :all_inclusion => { :in => ["1", "2", "3"], :message => "is invalid" }
end

