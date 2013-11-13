# coding: utf-8
require "test_class/model_base"

class ValuesUniquenessTestWithoutOption < ModelBase
  attr_accessor :seq

  validates :seq, :values_uniqueness => true
end

class ValuesUniquenessTestWithIgnoreNilValueOption < ModelBase
  attr_accessor :seq

  validates :seq, :values_uniqueness => { :ignore_nil_value => true }
end

class ValuesUniquenessTestWithIgnoreBlankValueOption < ModelBase
  attr_accessor :seq

  validates :seq, :values_uniqueness => { :ignore_blank_value => true }
end

class ValuesUniquenessTestWithMessageOption < ModelBase
  attr_accessor :seq

  validates :seq, :values_uniqueness => { :message => "is invalid" }
end

