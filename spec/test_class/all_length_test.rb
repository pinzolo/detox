# coding: utf-8
require "test_class/model_base"

class AllLengthTest < ModelBase
  attr_accessor :values

  validates :values, :all_length => { :in => 3..6 }
end

class AllLengthTestWithIgnoreNilValueOption < ModelBase
  attr_accessor :values

  validates :values, :all_length => { :in => 3..6, :ignore_nil_value => true }
end

class AllLengthTestWithIgnoreBlankValueOption < ModelBase
  attr_accessor :values

  validates :values, :all_length => { :in => 3..6, :ignore_blank_value => true }
end

class AllLengthTestWithMessageOption < ModelBase
  attr_accessor :values

  validates :values, :all_length => { :in => 3..6, :message => "is invalid" }
end


