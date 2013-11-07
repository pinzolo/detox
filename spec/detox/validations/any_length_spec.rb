# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/any_length_test"

describe Detox::Validations::AnyLengthValidator do
  describe "validation result" do
    context "when given no additional option" do# {{{
      before do
        @test = AnyLengthTest.new
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
          it "is invalid" do
            @test.values = [nil, "", "   "]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '1234567', '12', '1234567', '12'] (1 valid value)" do
          it "is valid" do
            @test.values = ['12345', '1234567', '12', '1234567', '12']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '12345', '1234567', '12', '1234567'] (2 valid values)" do
          it "is valid" do
            @test.values = ['12345', '12345', '1234567', '12', '1234567']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '12345', '12345', '1234567', '12'] (3 valid values)" do
          it "is valid" do
            @test.values = ['12345', '12345', '12345', '1234567', '12']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '12345', '12345', '12345', '1234567'] (4 valid values)" do
          it "is valid" do
            @test.values = ['12345', '12345', '12345', '12345', '1234567']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '12345', '12345', '12345', '12345'] (all valid values)" do
          it "is valid" do
            @test.values = ['12345', '12345', '12345', '12345', '12345']
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
          it "is invalid" do
            @test.values = { :a => nil, :b => "", :c => "   " }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '1234567', :c => '12', :d => '1234567' :e => '12' } (1 valid value)" do
          it "is valid" do
            @test.values = { :a => '12345', :b => '1234567', :c => '12', :d => '1234567', :e => '12' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '1234567', :d => '12' :e => '1234567' } (2 valid values)" do
          it "is valid" do
            @test.values = { :a => '12345', :b => '12345', :c => '1234567', :d => '12', :e => '1234567' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '12345', :d => '1234567', :e => '12' } (3 valid values)" do
          it "is valid" do
            @test.values = { :a => '12345', :b => '12345', :c => '12345', :d => '1234567', :e => '12' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '1234567' } (4 valid values)" do
          it "is valid" do
            @test.values = { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '1234567' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '12345' } (all valid values)" do
          it "is valid" do
            @test.values = { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '12345' }
            expect(@test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :min_valid_count option" do# {{{
      before do
        @test = AnyLengthTestWithMinValidCountOnly.new
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
          it "is invalid" do
            @test.values = [nil, "", "   "]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '1234567', '12', '1234567', '12'] (1 valid value)" do
          it "is invalid" do
            @test.values = ['12345', '1234567', '12', '1234567', '12']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '12345', '1234567', '12', '1234567'] (2 valid values)" do
          it "is valid" do
            @test.values = ['12345', '12345', '1234567', '12', '1234567']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '12345', '12345', '1234567', '12'] (3 valid values)" do
          it "is valid" do
            @test.values = ['12345', '12345', '12345', '1234567', '12']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '12345', '12345', '12345', '1234567'] (4 valid values)" do
          it "is valid" do
            @test.values = ['12345', '12345', '12345', '12345', '1234567']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '12345', '12345', '12345', '12345'] (all valid values)" do
          it "is valid" do
            @test.values = ['12345', '12345', '12345', '12345', '12345']
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
          it "is invalid" do
            @test.values = { :a => nil, :b => "", :c => "   " }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '1234567', :c => '12', :d => '1234567' :e => '12' } (1 valid value)" do
          it "is invalid" do
            @test.values = { :a => '12345', :b => '1234567', :c => '12', :d => '1234567', :e => '12' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '1234567', :d => '12' :e => '1234567' } (2 valid values)" do
          it "is valid" do
            @test.values = { :a => '12345', :b => '12345', :c => '1234567', :d => '12', :e => '1234567' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '12345', :d => '1234567', :e => '12' } (3 valid values)" do
          it "is valid" do
            @test.values = { :a => '12345', :b => '12345', :c => '12345', :d => '1234567', :e => '12' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '1234567' } (4 valid values)" do
          it "is valid" do
            @test.values = { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '1234567' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '12345' } (all valid values)" do
          it "is valid" do
            @test.values = { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '12345' }
            expect(@test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :max_valid_count option" do# {{{
      before do
        @test = AnyLengthTestWithMaxValidCountOnly.new
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
          it "is invalid" do
            @test.values = [nil, "", "   "]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '1234567', '12', '1234567', '12'] (1 valid value)" do
          it "is valid" do
            @test.values = ['12345', '1234567', '12', '1234567', '12']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '12345', '1234567', '12', '1234567'] (2 valid values)" do
          it "is valid" do
            @test.values = ['12345', '12345', '1234567', '12', '1234567']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '12345', '12345', '1234567', '12'] (3 valid values)" do
          it "is valid" do
            @test.values = ['12345', '12345', '12345', '1234567', '12']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '12345', '12345', '12345', '1234567'] (4 valid values)" do
          it "is invalid" do
            @test.values = ['12345', '12345', '12345', '12345', '1234567']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '12345', '12345', '12345', '12345'] (all valid values)" do
          it "is invalid" do
            @test.values = ['12345', '12345', '12345', '12345', '12345']
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
          it "is invalid" do
            @test.values = { :a => nil, :b => "", :c => "   " }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '1234567', :c => '12', :d => '1234567' :e => '12' } (1 valid value)" do
          it "is valid" do
            @test.values = { :a => '12345', :b => '1234567', :c => '12', :d => '1234567', :e => '12' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '1234567', :d => '12' :e => '1234567' } (2 valid values)" do
          it "is valid" do
            @test.values = { :a => '12345', :b => '12345', :c => '1234567', :d => '12', :e => '1234567' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '12345', :d => '1234567', :e => '12' } (3 valid values)" do
          it "is valid" do
            @test.values = { :a => '12345', :b => '12345', :c => '12345', :d => '1234567', :e => '12' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '1234567' } (4 valid values)" do
          it "is invalid" do
            @test.values = { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '1234567' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '12345' } (all valid values)" do
          it "is invalid" do
            @test.values = { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '12345' }
            expect(@test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      before do
        @test = AnyLengthTestWithBothValidCount.new
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
          it "is invalid" do
            @test.values = [nil, "", "   "]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '1234567', '12', '1234567', '12'] (1 valid value)" do
          it "is invalid" do
            @test.values = ['12345', '1234567', '12', '1234567', '12']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '12345', '1234567', '12', '1234567'] (2 valid values)" do
          it "is valid" do
            @test.values = ['12345', '12345', '1234567', '12', '1234567']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '12345', '12345', '1234567', '12'] (3 valid values)" do
          it "is valid" do
            @test.values = ['12345', '12345', '12345', '1234567', '12']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '12345', '12345', '12345', '1234567'] (4 valid values)" do
          it "is invalid" do
            @test.values = ['12345', '12345', '12345', '12345', '1234567']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '12345', '12345', '12345', '12345'] (all valid values)" do
          it "is invalid" do
            @test.values = ['12345', '12345', '12345', '12345', '12345']
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
          it "is invalid" do
            @test.values = { :a => nil, :b => "", :c => "   " }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '1234567', :c => '12', :d => '1234567' :e => '12' } (1 valid value)" do
          it "is invalid" do
            @test.values = { :a => '12345', :b => '1234567', :c => '12', :d => '1234567', :e => '12' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '1234567', :d => '12' :e => '1234567' } (2 valid values)" do
          it "is valid" do
            @test.values = { :a => '12345', :b => '12345', :c => '1234567', :d => '12', :e => '1234567' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '12345', :d => '1234567', :e => '12' } (3 valid values)" do
          it "is valid" do
            @test.values = { :a => '12345', :b => '12345', :c => '12345', :d => '1234567', :e => '12' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '1234567' } (4 valid values)" do
          it "is invalid" do
            @test.values = { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '1234567' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '12345' } (all valid values)" do
          it "is invalid" do
            @test.values = { :a => '12345', :b => '12345', :c => '12345', :d => '12345', :e => '12345' }
            expect(@test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}
  end

  describe "error message" do
    context "when given no option" do# {{{
      before do
        @test = AnyLengthTest.new
      end

      context "when valid" do
        before do
          @test.values = ['12345', '12345', '1234567']
          @test.valid?
        end

        it "has no message" do
          expect(@test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          @test.values = ['1234567', "", "   "]
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(@test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must be valid length (required number is 1-)"} do
          expect(@test.errors.full_messages.first).to eq "Values must be valid length (required number is 1-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.values = ['1234567', "", "   "]
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Values は必要数(1～)が正しい長さでなければなりません"
        end
      end
    end# }}}

    context "when given :min_valid_count option" do# {{{
      before do
        @test = AnyLengthTestWithMinValidCountOnly.new
      end

      context "when invalid" do
        before do
          @test.values = ['12345', "", "   "]
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(@test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must be valid length (required number is 2-)"} do
          expect(@test.errors.full_messages.first).to eq "Values must be valid length (required number is 2-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.values = ['12345', "", "   "]
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Values は必要数(2～)が正しい長さでなければなりません"
        end
      end
    end# }}}

    context "when given :max_valid_count option" do# {{{
      before do
        @test = AnyLengthTestWithMaxValidCountOnly.new
      end

      context "when invalid" do
        before do
          @test.values = ['12345', '12345', '12345', '12345', '1234567']
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(@test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must be valid length (required number is 1-3)"} do
          expect(@test.errors.full_messages.first).to eq "Values must be valid length (required number is 1-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.values = ['12345', '12345', '12345', '12345', '1234567']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Values は必要数(1～3)が正しい長さでなければなりません"
        end
      end
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      before do
        @test = AnyLengthTestWithBothValidCount.new
      end

      context "when invalid" do
        before do
          @test.values = ['12345', '12345', '12345', '12345', '1234567']
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(@test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must be valid length (required number is 2-3)"} do
          expect(@test.errors.full_messages.first).to eq "Values must be valid length (required number is 2-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.values = ['12345', '12345', '12345', '12345', '1234567']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Values は必要数(2～3)が正しい長さでなければなりません"
        end
      end
    end# }}}

    context "when given message option" do# {{{
      before do
        @test = AnyLengthTestWithMessageOption.new
      end
      context "when invalid" do
        before do
          @test.values = ['1234567', "", "   "]
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
          @test.values = ['1234567', "", "   "]
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

