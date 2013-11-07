# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/any_absence_test"

describe Detox::Validations::AnyAbsenceValidator do
  describe "validation result" do
    context "when given no additional option" do# {{{
      before do
        @test = AnyAbsenceTest.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.values = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.values = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all values are nil or empty or blank)" do
          it "is valid" do
            @test.values = [nil, "", "   "]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', 'foo', 'foo', 'foo', 'foo'] (1 valid value)" do
          it "is valid" do
            @test.values = ['', 'foo', 'foo', 'foo', 'foo']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', 'foo', 'foo', 'foo'] (2 valid values)" do
          it "is valid" do
            @test.values = ['', '', 'foo', 'foo', 'foo']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', '', 'foo', 'foo'] (3 valid values)" do
          it "is valid" do
            @test.values = ['', '', '', 'foo', 'foo']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', '', '', 'foo'] (4 valid values)" do
          it "is valid" do
            @test.values = ['', '', '', '', 'foo']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', '', '', ''] (all valid values)" do
          it "is valid" do
            @test.values = ['', '', '', '', '']
            expect(@test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.values = {}
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all values are nil or empty or blank)" do
          it "is valid" do
            @test.values = { :a => nil, :b => "", :c => "   " }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => 'foo', :c => 'foo', :d => 'foo' :e => 'foo' } (1 valid value)" do
          it "is valid" do
            @test.values = { :a => '', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => 'foo', :d => 'foo' :e => 'foo' } (2 valid values)" do
          it "is valid" do
            @test.values = { :a => '', :b => '', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => '', :d => 'foo', :e => 'foo' } (3 valid values)" do
          it "is valid" do
            @test.values = { :a => '', :b => '', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => '', :d => '', :e => 'foo' } (4 valid values)" do
          it "is valid" do
            @test.values = { :a => '', :b => '', :c => '', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => '', :d => '', :e => '' } (all valid values)" do
          it "is valid" do
            @test.values = { :a => '', :b => '', :c => '', :d => '', :e => '' }
            expect(@test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :min_valid_count option" do# {{{
      before do
        @test = AnyAbsenceTestWithMinValidCountOnly.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.values = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.values = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all values are nil or empty or blank)" do
          it "is valid" do
            @test.values = [nil, "", "   "]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', 'foo', 'foo', 'foo', 'foo'] (1 valid value)" do
          it "is invalid" do
            @test.values = ['', 'foo', 'foo', 'foo', 'foo']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['', '', 'foo', 'foo', 'foo'] (2 valid values)" do
          it "is valid" do
            @test.values = ['', '', 'foo', 'foo', 'foo']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', '', 'foo', 'foo'] (3 valid values)" do
          it "is valid" do
            @test.values = ['', '', '', 'foo', 'foo']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', '', '', 'foo'] (4 valid values)" do
          it "is valid" do
            @test.values = ['', '', '', '', 'foo']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', '', '', ''] (all valid values)" do
          it "is valid" do
            @test.values = ['', '', '', '', '']
            expect(@test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.values = {}
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all values are nil or empty or blank)" do
          it "is valid" do
            @test.values = { :a => nil, :b => "", :c => "   " }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => 'foo', :c => 'foo', :d => 'foo' :e => 'foo' } (1 valid value)" do
          it "is invalid" do
            @test.values = { :a => '', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '', :b => '', :c => 'foo', :d => 'foo' :e => 'foo' } (2 valid values)" do
          it "is valid" do
            @test.values = { :a => '', :b => '', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => '', :d => 'foo', :e => 'foo' } (3 valid values)" do
          it "is valid" do
            @test.values = { :a => '', :b => '', :c => '', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => '', :d => '', :e => 'foo' } (4 valid values)" do
          it "is valid" do
            @test.values = { :a => '', :b => '', :c => '', :d => '', :e => 'foo' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => '', :d => '', :e => '' } (all valid values)" do
          it "is valid" do
            @test.values = { :a => '', :b => '', :c => '', :d => '', :e => '' }
            expect(@test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :max_valid_count option" do# {{{
      before do
        @test = AnyAbsenceTestWithMaxValidCountOnly.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.values = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.values = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all values are nil or empty or blank)" do
          it "is valid" do
            @test.values = [nil, "", "   "]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', 'foo', 'foo', 'foo', 'foo'] (1 valid value)" do
          it "is valid" do
            @test.values = ['', 'foo', 'foo', 'foo', 'foo']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', 'foo', 'foo', 'foo'] (2 valid values)" do
          it "is valid" do
            @test.values = ['', '', 'foo', 'foo', 'foo']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', '', 'foo', 'foo'] (3 valid values)" do
          it "is valid" do
            @test.values = ['', '', '', 'foo', 'foo']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', '', '', 'foo'] (4 valid values)" do
          it "is invalid" do
            @test.values = ['', '', '', '', 'foo']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['', '', '', '', ''] (all valid values)" do
          it "is invalid" do
            @test.values = ['', '', '', '', '']
            expect(@test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.values = {}
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all values are nil or empty or blank)" do
          it "is valid" do
            @test.values = { :a => nil, :b => "", :c => "   " }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => 'foo', :c => 'foo', :d => 'foo' :e => 'foo' } (1 valid value)" do
          it "is valid" do
            @test.values = { :a => '', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => 'foo', :d => 'foo' :e => 'foo' } (2 valid values)" do
          it "is valid" do
            @test.values = { :a => '', :b => '', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => '', :d => 'foo', :e => 'foo' } (3 valid values)" do
          it "is valid" do
            @test.values = { :a => '', :b => '', :c => '', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => '', :d => '', :e => 'foo' } (4 valid values)" do
          it "is invalid" do
            @test.values = { :a => '', :b => '', :c => '', :d => '', :e => 'foo' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '', :b => '', :c => '', :d => '', :e => '' } (all valid values)" do
          it "is invalid" do
            @test.values = { :a => '', :b => '', :c => '', :d => '', :e => '' }
            expect(@test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      before do
        @test = AnyAbsenceTestWithBothValidCount.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.values = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.values = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all values are nil or empty or blank)" do
          it "is valid" do
            @test.values = [nil, "", "   "]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', 'foo', 'foo', 'foo', 'foo'] (1 valid value)" do
          it "is invalid" do
            @test.values = ['', 'foo', 'foo', 'foo', 'foo']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['', '', 'foo', 'foo', 'foo'] (2 valid values)" do
          it "is valid" do
            @test.values = ['', '', 'foo', 'foo', 'foo']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', '', 'foo', 'foo'] (3 valid values)" do
          it "is valid" do
            @test.values = ['', '', '', 'foo', 'foo']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', '', '', 'foo'] (4 valid values)" do
          it "is invalid" do
            @test.values = ['', '', '', '', 'foo']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['', '', '', '', ''] (all valid values)" do
          it "is invalid" do
            @test.values = ['', '', '', '', '']
            expect(@test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.values = {}
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all values are nil or empty or blank)" do
          it "is valid" do
            @test.values = { :a => nil, :b => "", :c => "   " }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => 'foo', :c => 'foo', :d => 'foo' :e => 'foo' } (1 valid value)" do
          it "is invalid" do
            @test.values = { :a => '', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '', :b => '', :c => 'foo', :d => 'foo' :e => 'foo' } (2 valid values)" do
          it "is valid" do
            @test.values = { :a => '', :b => '', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => '', :d => 'foo', :e => 'foo' } (3 valid values)" do
          it "is valid" do
            @test.values = { :a => '', :b => '', :c => '', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => '', :d => '', :e => 'foo' } (4 valid values)" do
          it "is invalid" do
            @test.values = { :a => '', :b => '', :c => '', :d => '', :e => 'foo' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '', :b => '', :c => '', :d => '', :e => '' } (all valid values)" do
          it "is invalid" do
            @test.values = { :a => '', :b => '', :c => '', :d => '', :e => '' }
            expect(@test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}
  end

  describe "error message" do
    context "when given no option" do# {{{
      before do
        @test = AnyAbsenceTest.new
      end

      context "when valid" do
        before do
          @test.values = ['', '', 'foo']
          @test.valid?
        end

        it "has no message" do
          expect(@test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          @test.values = ['foo', 'bar', 'baz']
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(@test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must contain blank value (required number is 1-)"} do
          expect(@test.errors.full_messages.first).to eq "Values must contain blank value (required number is 1-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.values = ['foo', 'bar', 'baz']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Values には空の値が必要数(1～)含まれている必要があります"
        end
      end
    end# }}}

    context "when given :min_valid_count option" do# {{{
      before do
        @test = AnyAbsenceTestWithMinValidCountOnly.new
      end

      context "when invalid" do
        before do
          @test.values = ['foo', 'bar', 'baz']
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(@test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must contain blank value (required number is 2-)"} do
          expect(@test.errors.full_messages.first).to eq "Values must contain blank value (required number is 2-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.values = ['foo', "bar", "baz"]
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Values には空の値が必要数(2～)含まれている必要があります"
        end
      end
    end# }}}

    context "when given :max_valid_count option" do# {{{
      before do
        @test = AnyAbsenceTestWithMaxValidCountOnly.new
      end

      context "when invalid" do
        before do
          @test.values = ['', '', '', '', 'foo']
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(@test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must contain blank value (required number is 1-3)"} do
          expect(@test.errors.full_messages.first).to eq "Values must contain blank value (required number is 1-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.values = ['', '', '', '', 'foo']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Values には空の値が必要数(1～3)含まれている必要があります"
        end
      end
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      before do
        @test = AnyAbsenceTestWithBothValidCount.new
      end

      context "when invalid" do
        before do
          @test.values = ['', '', '', '', 'foo']
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(@test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must contain blank value (required number is 2-3)"} do
          expect(@test.errors.full_messages.first).to eq "Values must contain blank value (required number is 2-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.values = ['', '', '', '', 'foo']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Values には空の値が必要数(2～3)含まれている必要があります"
        end
      end
    end# }}}

    context "when given message option" do# {{{
      before do
        @test = AnyAbsenceTestWithMessageOption.new
      end
      context "when invalid" do
        before do
          @test.values = ['foo', "bar", "baz"]
          @test.valid?
        end
        it "error messsage uses given message" do
          expect(@test.errors.full_messages.first).to eq 'Values is invalid'
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.values = ['foo', "bar", "baz"]
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is not translated" do
          expect(@test.errors.full_messages.first).to eq 'Values is invalid'
        end
      end
    end# }}}
  end
end

