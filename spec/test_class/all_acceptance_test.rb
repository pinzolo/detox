# coding: utf-8
require "test_class/model_base"

class AllAcceptanceTest < ModelBase
  attr_accessor :flags

  validates :flags, :all_acceptance => true
end

class AllAcceptanceTestWithIgnoreNilValueOption < ModelBase
  attr_accessor :flags

  validates :flags, :all_acceptance => { :ignore_nil_value => true }
end

class AllAcceptanceTestWithIgnoreBlankValueOption < ModelBase
  attr_accessor :flags

  validates :flags, :all_acceptance => { :ignore_blank_value => true }
end

class AllAcceptanceTestWithMessageOption < ModelBase
  attr_accessor :flags

  validates :flags, :all_acceptance => { :message => "is invalid" }
end

