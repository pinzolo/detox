# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/any_numericality_test"

describe Detox::Validations::AnyNumericalityValidator do
  describe "validation result" do
    context "when given no additional option" do# {{{
      let(:test) { AnyNumericalityTest.new }

      context "when apply to nil" do
        it "is valid" do
          test.prices = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.prices = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all prices are nil or empty or blank)" do
          it "is invalid" do
            test.prices = [nil, "", "   "]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['0', 'foo', 'foo', 'foo', 'foo'] (1 valid value)" do
          it "is valid" do
            test.prices = ['0', 'foo', 'foo', 'foo', 'foo']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['-1', 'foo', 'foo', 'foo', 'foo'] (negative value)" do
          it "is valid" do
            test.prices = ['-1', 'foo', 'foo', 'foo', 'foo']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0.5', 'foo', 'foo', 'foo', 'foo'] (not integer)" do
          it "is valid" do
            test.prices = ['0.5', 'foo', 'foo', 'foo', 'foo']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '0', 'foo', 'foo', 'foo'] (2 valid prices)" do
          it "is valid" do
            test.prices = ['0', '0', 'foo', 'foo', 'foo']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '0', '0', 'foo', 'foo'] (3 valid prices)" do
          it "is valid" do
            test.prices = ['0', '0', '0', 'foo', 'foo']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '0', '0', '0', 'foo'] (4 valid prices)" do
          it "is valid" do
            test.prices = ['0', '0', '0', '0', 'foo']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '0', '0', '0', '0'] (all valid prices)" do
          it "is valid" do
            test.prices = ['0', '0', '0', '0', '0']
            expect(test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.prices = {}
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all prices are nil or empty or blank)" do
          it "is invalid" do
            test.prices = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '0', :b => 'foo', :c => 'foo', :d => 'foo' :e => 'foo' } (1 valid value)" do
          it "is valid" do
            test.prices = { :a => '0', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => 'foo', :d => 'foo' :e => 'foo' } (2 valid prices)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '0', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => '0', :d => 'foo', :e => 'foo' } (3 valid prices)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '0', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => '0', :d => '0', :e => 'foo' } (4 valid prices)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '0', :c => '0', :d => 'foo', :e => 'foo' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => '0', :d => '0', :e => '0' } (all valid prices)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '0', :c => '0', :d => '0', :e => '0' }
            expect(test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :min_valid_count option" do# {{{
      let(:test) { AnyNumericalityTestWithMinValidCountOnly.new }

      context "when apply to nil" do
        it "is valid" do
          test.prices = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.prices = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all prices are nil or empty or blank)" do
          it "is invalid" do
            test.prices = [nil, "", "   "]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['0', 'foo', 'foo', 'foo', 'foo'] (1 valid value)" do
          it "is invalid" do
            test.prices = ['0', 'foo', 'foo', 'foo', 'foo']
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['0', '0', 'foo', 'foo', 'foo'] (2 valid prices)" do
          it "is valid" do
            test.prices = ['0', '0', 'foo', 'foo', 'foo']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '0', '0', 'foo', 'foo'] (3 valid prices)" do
          it "is valid" do
            test.prices = ['0', '0', '0', 'foo', 'foo']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '0', '0', '0', 'foo'] (4 valid prices)" do
          it "is valid" do
            test.prices = ['0', '0', '0', '0', 'foo']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '0', '0', '0', '0'] (all valid prices)" do
          it "is valid" do
            test.prices = ['0', '0', '0', '0', '0']
            expect(test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.prices = {}
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all prices are nil or empty or blank)" do
          it "is invalid" do
            test.prices = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '0', :b => 'foo', :c => 'foo', :d => 'foo' :e => 'foo' } (1 valid value)" do
          it "is invalid" do
            test.prices = { :a => '0', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => 'foo', :d => 'foo' :e => 'foo' } (2 valid prices)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '0', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => '0', :d => 'foo', :e => 'foo' } (3 valid prices)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '0', :c => '0', :d => 'foo', :e => 'foo' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => '0', :d => '0', :e => 'foo' } (4 valid prices)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '0', :c => '0', :d => '0', :e => 'foo' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => '0', :d => '0', :e => '0' } (all valid prices)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '0', :c => '0', :d => '0', :e => '0' }
            expect(test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :max_valid_count option" do# {{{
      let(:test) { AnyNumericalityTestWithMaxValidCountOnly.new }

      context "when apply to nil" do
        it "is valid" do
          test.prices = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.prices = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all prices are nil or empty or blank)" do
          it "is invalid" do
            test.prices = [nil, "", "   "]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['0', 'foo', 'foo', 'foo', 'foo'] (1 valid value)" do
          it "is valid" do
            test.prices = ['0', 'foo', 'foo', 'foo', 'foo']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '0', 'foo', 'foo', 'foo'] (2 valid prices)" do
          it "is valid" do
            test.prices = ['0', '0', 'foo', 'foo', 'foo']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '0', '0', 'foo', 'foo'] (3 valid prices)" do
          it "is valid" do
            test.prices = ['0', '0', '0', 'foo', 'foo']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '0', '0', '0', 'foo'] (4 valid prices)" do
          it "is invalid" do
            test.prices = ['0', '0', '0', '0', 'foo']
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['0', '0', '0', '0', '0'] (all valid prices)" do
          it "is invalid" do
            test.prices = ['0', '0', '0', '0', '0']
            expect(test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.prices = {}
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all prices are nil or empty or blank)" do
          it "is invalid" do
            test.prices = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '0', :b => 'foo', :c => 'foo', :d => 'foo' :e => 'foo' } (1 valid value)" do
          it "is valid" do
            test.prices = { :a => '0', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => 'foo', :d => 'foo' :e => 'foo' } (2 valid prices)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '0', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => '0', :d => 'foo', :e => 'foo' } (3 valid prices)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '0', :c => '0', :d => 'foo', :e => 'foo' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => '0', :d => '0', :e => 'foo' } (4 valid prices)" do
          it "is invalid" do
            test.prices = { :a => '0', :b => '0', :c => '0', :d => '0', :e => 'foo' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => '0', :d => '0', :e => '0' } (all valid prices)" do
          it "is invalid" do
            test.prices = { :a => '0', :b => '0', :c => '0', :d => '0', :e => '0' }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      let(:test) { AnyNumericalityTestWithBothValidCount.new }

      context "when apply to nil" do
        it "is valid" do
          test.prices = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.prices = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all prices are nil or empty or blank)" do
          it "is invalid" do
            test.prices = [nil, "", "   "]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['0', 'foo', 'foo', 'foo', 'foo'] (1 valid value)" do
          it "is invalid" do
            test.prices = ['0', 'foo', 'foo', 'foo', 'foo']
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['0', '0', 'foo', 'foo', 'foo'] (2 valid prices)" do
          it "is valid" do
            test.prices = ['0', '0', 'foo', 'foo', 'foo']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '0', '0', 'foo', 'foo'] (3 valid prices)" do
          it "is valid" do
            test.prices = ['0', '0', '0', 'foo', 'foo']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '0', '0', '0', 'foo'] (4 valid prices)" do
          it "is invalid" do
            test.prices = ['0', '0', '0', '0', 'foo']
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['0', '0', '0', '0', '0'] (all valid prices)" do
          it "is invalid" do
            test.prices = ['0', '0', '0', '0', '0']
            expect(test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.prices = {}
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all prices are nil or empty or blank)" do
          it "is invalid" do
            test.prices = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '0', :b => 'foo', :c => 'foo', :d => 'foo' :e => 'foo' } (1 valid value)" do
          it "is invalid" do
            test.prices = { :a => '0', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => 'foo', :d => 'foo' :e => 'foo' } (2 valid prices)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '0', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => '0', :d => 'foo', :e => 'foo' } (3 valid prices)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '0', :c => '0', :d => 'foo', :e => 'foo' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => '0', :d => '0', :e => 'foo' } (4 valid prices)" do
          it "is invalid" do
            test.prices = { :a => '0', :b => '0', :c => '0', :d => '0', :e => 'foo' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '0', :b => '0', :c => '0', :d => '0', :e => '0' } (all valid prices)" do
          it "is invalid" do
            test.prices = { :a => '0', :b => '0', :c => '0', :d => '0', :e => '0' }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}
  end

  describe "error message" do
    context "when given no option" do# {{{
      let(:test) { AnyNumericalityTest.new }

      context "when valid" do
        before do
          test.prices = ['0', '0', 'foo']
          test.valid?
        end

        it "has no message" do
          expect(test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          test.prices = ['foo', "", "   "]
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with prices attribute" do
          expect(test.errors.include?(:prices)).to eq true
        end
        it %q{error messsage is "Prices must be numeric (required number is 1-)"} do
          expect(test.errors.full_messages.first).to eq "Prices must be numeric (required number is 1-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.prices = ['foo', "", "   "]
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Prices は必要数(1～)が数値でなければなりません"
        end
      end
    end# }}}

    context "when given :min_valid_count option" do# {{{
      let(:test) { AnyNumericalityTestWithMinValidCountOnly.new }

      context "when invalid" do
        before do
          test.prices = ['0', "", "   "]
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with prices attribute" do
          expect(test.errors.include?(:prices)).to eq true
        end
        it %q{error messsage is "Prices must be numeric (required number is 2-)"} do
          expect(test.errors.full_messages.first).to eq "Prices must be numeric (required number is 2-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.prices = ['0', "", "   "]
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Prices は必要数(2～)が数値でなければなりません"
        end
      end
    end# }}}

    context "when given :max_valid_count option" do# {{{
      let(:test) { AnyNumericalityTestWithMaxValidCountOnly.new }

      context "when invalid" do
        before do
          test.prices = ['0', '0', '0', '0', 'foo']
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with prices attribute" do
          expect(test.errors.include?(:prices)).to eq true
        end
        it %q{error messsage is "Prices must be numeric (required number is 1-3)"} do
          expect(test.errors.full_messages.first).to eq "Prices must be numeric (required number is 1-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.prices = ['0', '0', '0', '0', 'foo']
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Prices は必要数(1～3)が数値でなければなりません"
        end
      end
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      let(:test) { AnyNumericalityTestWithBothValidCount.new }

      context "when invalid" do
        before do
          test.prices = ['0', '0', '0', '0', 'foo']
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with prices attribute" do
          expect(test.errors.include?(:prices)).to eq true
        end
        it %q{error messsage is "Prices must be numeric (required number is 2-3)"} do
          expect(test.errors.full_messages.first).to eq "Prices must be numeric (required number is 2-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.prices = ['0', '0', '0', '0', 'foo']
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Prices は必要数(2～3)が数値でなければなりません"
        end
      end
    end# }}}

    context "when given message option" do# {{{
      let(:test) { AnyNumericalityTestWithMessageOption.new }

      context "when invalid" do
        before do
          test.prices = ['foo', "", "   "]
          test.valid?
        end
        it "error messsage uses given message" do
          expect(test.errors.full_messages.first).to eq 'Prices is invalid'
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.prices = ['foo', "", "   "]
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is not translated" do
          expect(test.errors.full_messages.first).to eq 'Prices is invalid'
        end
      end
    end# }}}
  end
end

