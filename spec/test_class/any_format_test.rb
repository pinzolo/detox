# coding: utf-8
require "test_class/model_base"

class AnyFormatTest < ModelBase
  attr_accessor :words

  validates :words, :any_format => { :with => /\A\w+\z/ }
end

class AnyFormatTestWithMinValidCountOnly < ModelBase
  attr_accessor :words

  validates :words, :any_format => { :with => /\A\w+\z/, :min_valid_count => 2 }
end

class AnyFormatTestWithMaxValidCountOnly < ModelBase
  attr_accessor :words

  validates :words, :any_format => { :with => /\A\w+\z/, :max_valid_count => 3 }
end

class AnyFormatTestWithBothValidCount < ModelBase
  attr_accessor :words

  validates :words, :any_format => { :with => /\A\w+\z/, :min_valid_count => 2, :max_valid_count => 3 }
end

class AnyFormatTestWithMessageOption < ModelBase
  attr_accessor :words

  validates :words, :any_format => { :with => /\A\w+\z/, :message => "is invalid" }
end


