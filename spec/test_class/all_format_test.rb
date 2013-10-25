# coding: utf-8
require "test_class/model_base"

class AllFormatTest < ModelBase
  attr_accessor :words

  validates :words, :all_format => { :with => /\A\w+\z/ }
end

class AllFormatTestWithIgnoreNilValueOption < ModelBase
  attr_accessor :words

  validates :words, :all_format => { :with => /\A\w+\z/, :ignore_nil_value => true }
end

class AllFormatTestWithIgnoreBlankValueOption < ModelBase
  attr_accessor :words

  validates :words, :all_format => { :with => /\A\w+\z/, :ignore_blank_value => true }
end

class AllFormatTestWithMessageOption < ModelBase
  attr_accessor :words

  validates :words, :all_format => { :with => /\A\w+\z/, :message => "is invalid" }
end
