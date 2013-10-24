# coding: utf-8
require "test_class/model_base"

class OrderingTestWithoutOption < ModelBase
  attr_accessor :seq

  validates :seq, :ordering => true
end

class OrderingTestWithIgnoreNilValueOption < ModelBase
  attr_accessor :seq

  validates :seq, :ordering => { :ignore_nil_value => true }
end

class OrderingTestWithIgnoreBlankValueOption < ModelBase
  attr_accessor :seq

  validates :seq, :ordering => { :ignore_blank_value => true }
end

class OrderingTestWithStartWithOption < ModelBase
  attr_accessor :seq

  validates :seq, :ordering => { :start_with => 3 }
end

class OrderingTestWithMessageOption < ModelBase
  attr_accessor :seq

  validates :seq, :ordering => { :message => "contains invalid sequence" }
end

