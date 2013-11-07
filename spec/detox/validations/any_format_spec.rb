# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/any_format_test"

describe Detox::Validations::AnyFormatValidator do
  describe "validation result" do
    context "when given no additional option" do# {{{
      before do
        @test = AnyFormatTest.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.words = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.words = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all words are nil or empty or blank)" do
          it "is invalid" do
            @test.words = [nil, "", "   "]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['foo', 'b@r', 'b@r', 'b@r', 'b@r'] (1 valid value)" do
          it "is valid" do
            @test.words = ['foo', 'b@r', 'b@r', 'b@r', 'b@r']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'foo', 'b@r', 'b@r', 'b@r'] (2 valid words)" do
          it "is valid" do
            @test.words = ['foo', 'foo', 'b@r', 'b@r', 'b@r']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'foo', 'foo', 'b@r', 'b@r'] (3 valid words)" do
          it "is valid" do
            @test.words = ['foo', 'foo', 'foo', 'b@r', 'b@r']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'foo', 'foo', 'foo', 'b@r'] (4 valid words)" do
          it "is valid" do
            @test.words = ['foo', 'foo', 'foo', 'foo', 'b@r']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'foo', 'foo', 'foo', 'foo'] (all valid words)" do
          it "is valid" do
            @test.words = ['foo', 'foo', 'foo', 'foo', 'foo']
            expect(@test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.words = {}
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all words are nil or empty or blank)" do
          it "is invalid" do
            @test.words = { :a => nil, :b => "", :c => "   " }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => 'foo', :b => 'b@r', :c => 'b@r', :d => 'b@r' :e => 'b@r' } (1 valid value)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'b@r', :c => 'b@r', :d => 'b@r', :e => 'b@r' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'b@r', :d => 'b@r' :e => 'b@r' } (2 valid words)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'b@r', :d => 'b@r', :e => 'b@r' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'b@r', :e => 'b@r' } (3 valid words)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'b@r', :d => 'b@r', :e => 'b@r' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'b@r' } (4 valid words)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'b@r', :e => 'b@r' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' } (all valid words)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :min_valid_count option" do# {{{
      before do
        @test = AnyFormatTestWithMinValidCountOnly.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.words = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.words = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all words are nil or empty or blank)" do
          it "is invalid" do
            @test.words = [nil, "", "   "]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['foo', 'b@r', 'b@r', 'b@r', 'b@r'] (1 valid value)" do
          it "is invalid" do
            @test.words = ['foo', 'b@r', 'b@r', 'b@r', 'b@r']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['foo', 'foo', 'b@r', 'b@r', 'b@r'] (2 valid words)" do
          it "is valid" do
            @test.words = ['foo', 'foo', 'b@r', 'b@r', 'b@r']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'foo', 'foo', 'b@r', 'b@r'] (3 valid words)" do
          it "is valid" do
            @test.words = ['foo', 'foo', 'foo', 'b@r', 'b@r']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'foo', 'foo', 'foo', 'b@r'] (4 valid words)" do
          it "is valid" do
            @test.words = ['foo', 'foo', 'foo', 'foo', 'b@r']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'foo', 'foo', 'foo', 'foo'] (all valid words)" do
          it "is valid" do
            @test.words = ['foo', 'foo', 'foo', 'foo', 'foo']
            expect(@test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.words = {}
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all words are nil or empty or blank)" do
          it "is invalid" do
            @test.words = { :a => nil, :b => "", :c => "   " }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => 'foo', :b => 'b@r', :c => 'b@r', :d => 'b@r' :e => 'b@r' } (1 valid value)" do
          it "is invalid" do
            @test.words = { :a => 'foo', :b => 'b@r', :c => 'b@r', :d => 'b@r', :e => 'b@r' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'b@r', :d => 'b@r' :e => 'b@r' } (2 valid words)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'b@r', :d => 'b@r', :e => 'b@r' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'b@r', :e => 'b@r' } (3 valid words)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'b@r', :e => 'b@r' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'b@r' } (4 valid words)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'b@r' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' } (all valid words)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :max_valid_count option" do# {{{
      before do
        @test = AnyFormatTestWithMaxValidCountOnly.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.words = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.words = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all words are nil or empty or blank)" do
          it "is invalid" do
            @test.words = [nil, "", "   "]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['foo', 'b@r', 'b@r', 'b@r', 'b@r'] (1 valid value)" do
          it "is valid" do
            @test.words = ['foo', 'b@r', 'b@r', 'b@r', 'b@r']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'foo', 'b@r', 'b@r', 'b@r'] (2 valid words)" do
          it "is valid" do
            @test.words = ['foo', 'foo', 'b@r', 'b@r', 'b@r']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'foo', 'foo', 'b@r', 'b@r'] (3 valid words)" do
          it "is valid" do
            @test.words = ['foo', 'foo', 'foo', 'b@r', 'b@r']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'foo', 'foo', 'foo', 'b@r'] (4 valid words)" do
          it "is invalid" do
            @test.words = ['foo', 'foo', 'foo', 'foo', 'b@r']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['foo', 'foo', 'foo', 'foo', 'foo'] (all valid words)" do
          it "is invalid" do
            @test.words = ['foo', 'foo', 'foo', 'foo', 'foo']
            expect(@test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.words = {}
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all words are nil or empty or blank)" do
          it "is invalid" do
            @test.words = { :a => nil, :b => "", :c => "   " }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => 'foo', :b => 'b@r', :c => 'b@r', :d => 'b@r' :e => 'b@r' } (1 valid value)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'b@r', :c => 'b@r', :d => 'b@r', :e => 'b@r' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'b@r', :d => 'b@r' :e => 'b@r' } (2 valid words)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'b@r', :d => 'b@r', :e => 'b@r' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'b@r', :e => 'b@r' } (3 valid words)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'b@r', :e => 'b@r' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'b@r' } (4 valid words)" do
          it "is invalid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'b@r' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' } (all valid words)" do
          it "is invalid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      before do
        @test = AnyFormatTestWithBothValidCount.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.words = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.words = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all words are nil or empty or blank)" do
          it "is invalid" do
            @test.words = [nil, "", "   "]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['foo', 'b@r', 'b@r', 'b@r', 'b@r'] (1 valid value)" do
          it "is invalid" do
            @test.words = ['foo', 'b@r', 'b@r', 'b@r', 'b@r']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['foo', 'foo', 'b@r', 'b@r', 'b@r'] (2 valid words)" do
          it "is valid" do
            @test.words = ['foo', 'foo', 'b@r', 'b@r', 'b@r']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'foo', 'foo', 'b@r', 'b@r'] (3 valid words)" do
          it "is valid" do
            @test.words = ['foo', 'foo', 'foo', 'b@r', 'b@r']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'foo', 'foo', 'foo', 'b@r'] (4 valid words)" do
          it "is invalid" do
            @test.words = ['foo', 'foo', 'foo', 'foo', 'b@r']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['foo', 'foo', 'foo', 'foo', 'foo'] (all valid words)" do
          it "is invalid" do
            @test.words = ['foo', 'foo', 'foo', 'foo', 'foo']
            expect(@test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.words = {}
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all words are nil or empty or blank)" do
          it "is invalid" do
            @test.words = { :a => nil, :b => "", :c => "   " }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => 'foo', :b => 'b@r', :c => 'b@r', :d => 'b@r' :e => 'b@r' } (1 valid value)" do
          it "is invalid" do
            @test.words = { :a => 'foo', :b => 'b@r', :c => 'b@r', :d => 'b@r', :e => 'b@r' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'b@r', :d => 'b@r' :e => 'b@r' } (2 valid words)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'b@r', :d => 'b@r', :e => 'b@r' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'b@r', :e => 'b@r' } (3 valid words)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'b@r', :e => 'b@r' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'b@r' } (4 valid words)" do
          it "is invalid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'b@r' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' } (all valid words)" do
          it "is invalid" do
            @test.words = { :a => 'foo', :b => 'foo', :c => 'foo', :d => 'foo', :e => 'foo' }
            expect(@test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}
  end

  describe "error message" do
    context "when given no option" do# {{{
      before do
        @test = AnyFormatTest.new
      end

      context "when valid" do
        before do
          @test.words = ['foo', 'foo', 'b@r']
          @test.valid?
        end

        it "has no message" do
          expect(@test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          @test.words = ['b@r', "", "   "]
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with words attribute" do
          expect(@test.errors.include?(:words)).to eq true
        end
        it %q{error messsage is "Words must be valid format (required number is 1-)"} do
          expect(@test.errors.full_messages.first).to eq "Words must be valid format (required number is 1-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.words = ['b@r', "", "   "]
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Words は必要数(1～)が正しい形式でなければなりません"
        end
      end
    end# }}}

    context "when given :min_valid_count option" do# {{{
      before do
        @test = AnyFormatTestWithMinValidCountOnly.new
      end

      context "when invalid" do
        before do
          @test.words = ['foo', "", "   "]
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with words attribute" do
          expect(@test.errors.include?(:words)).to eq true
        end
        it %q{error messsage is "Words must be valid format (required number is 2-)"} do
          expect(@test.errors.full_messages.first).to eq "Words must be valid format (required number is 2-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.words = ['foo', "", "   "]
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Words は必要数(2～)が正しい形式でなければなりません"
        end
      end
    end# }}}

    context "when given :max_valid_count option" do# {{{
      before do
        @test = AnyFormatTestWithMaxValidCountOnly.new
      end

      context "when invalid" do
        before do
          @test.words = ['foo', 'foo', 'foo', 'foo', 'b@r']
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with words attribute" do
          expect(@test.errors.include?(:words)).to eq true
        end
        it %q{error messsage is "Words must be valid format (required number is 1-3)"} do
          expect(@test.errors.full_messages.first).to eq "Words must be valid format (required number is 1-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.words = ['foo', 'foo', 'foo', 'foo', 'b@r']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Words は必要数(1～3)が正しい形式でなければなりません"
        end
      end
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      before do
        @test = AnyFormatTestWithBothValidCount.new
      end

      context "when invalid" do
        before do
          @test.words = ['foo', 'foo', 'foo', 'foo', 'b@r']
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with words attribute" do
          expect(@test.errors.include?(:words)).to eq true
        end
        it %q{error messsage is "Words must be valid format (required number is 2-3)"} do
          expect(@test.errors.full_messages.first).to eq "Words must be valid format (required number is 2-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.words = ['foo', 'foo', 'foo', 'foo', 'b@r']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Words は必要数(2～3)が正しい形式でなければなりません"
        end
      end
    end# }}}

    context "when given message option" do# {{{
      before do
        @test = AnyFormatTestWithMessageOption.new
      end
      context "when invalid" do
        before do
          @test.words = ['b@r', "", "   "]
          @test.valid?
        end
        it "error messsage uses given message" do
          expect(@test.errors.full_messages.first).to eq 'Words is invalid'
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.words = ['b@r', "", "   "]
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is not translated" do
          expect(@test.errors.full_messages.first).to eq 'Words is invalid'
        end
      end
    end# }}}
  end
end

