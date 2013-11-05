# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/any_acceptance_test"

describe Detox::Validations::AnyAcceptanceValidator do
  describe "validation result" do
    context "when given no additional option" do# {{{
      before do
        @test = AnyAcceptanceTest.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.flags = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.flags = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', '   '] (all flags are '' or empty or blank)" do
          it "is invalid" do
            @test.flags = ['', "", "   "]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['1', '', '', '', ''] (1 valid value)" do
          it "is valid" do
            @test.flags = ["1", '', '', '', '']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '', '', ''] (2 valid flags)" do
          it "is valid" do
            @test.flags = ["1", "1", '', '', '']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '', ''] (3 valid flags)" do
          it "is valid" do
            @test.flags = ["1", "1", "1", '', '']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '1', ''] (4 valid flags)" do
          it "is valid" do
            @test.flags = ["1", "1", "1", "1", '']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '1', '1'] (all valid flags)" do
          it "is valid" do
            @test.flags = ["1", "1", "1", "1", "1"]
            expect(@test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.flags = {}
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => '   ' } (all flags are '' or empty or blank)" do
          it "is invalid" do
            @test.flags = { :a => '', :b => "", :c => "   " }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '', :c => '', :d => '' :e => '' } (1 valid value)" do
          it "is valid" do
            @test.flags = { :a => "1", :b => '', :c => '', :d => '', :e => '' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '', :d => '' :e => '' } (2 valid flags)" do
          it "is valid" do
            @test.flags = { :a => "1", :b => "1", :c => '', :d => '', :e => '' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '', :e => '' } (3 valid flags)" do
          it "is valid" do
            @test.flags = { :a => "1", :b => "1", :c => '', :d => '', :e => '' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '' } (4 valid flags)" do
          it "is valid" do
            @test.flags = { :a => "1", :b => "1", :c => "1", :d => '', :e => '' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '1' } (all valid flags)" do
          it "is valid" do
            @test.flags = { :a => "1", :b => "1", :c => "1", :d => "1", :e => "1" }
            expect(@test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :min_valid_count option" do# {{{
      before do
        @test = AnyAcceptanceTestWithMinValidCountOnly.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.flags = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.flags = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', '   '] (all flags are '' or empty or blank)" do
          it "is invalid" do
            @test.flags = ['', "", "   "]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['1', '', '', '', ''] (1 valid value)" do
          it "is invalid" do
            @test.flags = ["1", '', '', '', '']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['1', '1', '', '', ''] (2 valid values)" do
          it "is valid" do
            @test.flags = ["1", "1", '', '', '']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '', ''] (3 valid values)" do
          it "is valid" do
            @test.flags = ["1", "1", "1", '', '']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '1', ''] (4 valid values)" do
          it "is valid" do
            @test.flags = ["1", "1", "1", "1", '']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '1', '1'] (all valid flags)" do
          it "is valid" do
            @test.flags = ["1", "1", "1", "1", "1"]
            expect(@test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.flags = {}
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => '   ' } (all flags are '' or empty or blank)" do
          it "is invalid" do
            @test.flags = { :a => '', :b => "", :c => "   " }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '', :c => '', :d => '' :e => '' } (1 valid value)" do
          it "is invalid" do
            @test.flags = { :a => "1", :b => '', :c => '', :d => '', :e => '' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '', :d => '' :e => '' } (1 valid flags)" do
          it "is valid" do
            @test.flags = { :a => "1", :b => "1", :c => '', :d => '', :e => '' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '', :e => '' } (1 valid flags)" do
          it "is valid" do
            @test.flags = { :a => "1", :b => "1", :c => "1", :d => '', :e => '' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '' } (1 valid flags)" do
          it "is valid" do
            @test.flags = { :a => "1", :b => "1", :c => "1", :d => "1", :e => '' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '1' } (all valid flags)" do
          it "is valid" do
            @test.flags = { :a => "1", :b => "1", :c => "1", :d => "1", :e => "1" }
            expect(@test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :max_valid_count option" do# {{{
      before do
        @test = AnyAcceptanceTestWithMaxValidCountOnly.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.flags = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.flags = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', '   '] (all flags are '' or empty or blank)" do
          it "is invalid" do
            @test.flags = ['', "", "   "]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['1', '', '', '', ''] (1 valid value)" do
          it "is valid" do
            @test.flags = ["1", '', '', '', '']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '', '', ''] (2 valid values)" do
          it "is valid" do
            @test.flags = ["1", "1", '', '', '']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '', ''] (3 valid values)" do
          it "is valid" do
            @test.flags = ["1", "1", "1", '', '']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '1', ''] (4 valid values)" do
          it "is invalid" do
            @test.flags = ["1", "1", "1", "1", '']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['1', '1', '1', '1', '1'] (all valid values)" do
          it "is invalid" do
            @test.flags = ["1", "1", "1", "1", "1"]
            expect(@test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.flags = {}
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => '', :d => '' :e => '' } (all flags are '' or empty or blank)" do
          it "is invalid" do
            @test.flags = { :a => '', :b => "", :c => "   " }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '', :c => '', :d => '' :e => '' } (1 valid value)" do
          it "is valid" do
            @test.flags = { :a => "1", :b => '', :c => '', :d => '', :e => '' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '', :d => '' :e => '' } (2 valid values)" do
          it "is valid" do
            @test.flags = { :a => "1", :b => "1", :c => '', :d => '', :e => '' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '', :e => '' } (3 valid values)" do
          it "is valid" do
            @test.flags = { :a => "1", :b => "1", :c => "1", :d => '', :e => '' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '' } (4 valid values)" do
          it "is invalid" do
            @test.flags = { :a => "1", :b => "1", :c => "1", :d => "1", :e => '' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '1' } (all valid values)" do
          it "is invalid" do
            @test.flags = { :a => "1", :b => "1", :c => "1", :d => "1", :e => "1" }
            expect(@test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      before do
        @test = AnyAcceptanceTestWithBothValidCount.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.flags = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.flags = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['', '', '   '] (all flags are '' or empty or blank)" do
          it "is invalid" do
            @test.flags = ['', "", "   "]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['1', '', '', '', ''] (1 valid value)" do
          it "is invalid" do
            @test.flags = ["1", '', '', '', '']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['1', '1', '', '', ''] (2 valid values)" do
          it "is valid" do
            @test.flags = ["1", "1", '', '', '']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '', ''] (3 valid values)" do
          it "is valid" do
            @test.flags = ["1", "1", "1", '', '']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '1', ''] (4 valid values)" do
          it "is invalid" do
            @test.flags = ["1", "1", "1", "1", '']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['1', '1', '1', '1', '1'] (all valid values)" do
          it "is invalid" do
            @test.flags = ["1", "1", "1", "1", "1"]
            expect(@test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.flags = {}
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '', :b => '', :c => '   ' } (all flags are '' or empty or blank)" do
          it "is invalid" do
            @test.flags = { :a => '', :b => "", :c => "   " }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '', :c => '', :d => '' :e => '' } (1 valid value)" do
          it "is invalid" do
            @test.flags = { :a => "1", :b => '', :c => '', :d => '', :e => '' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '', :d => '' :e => '' } (2 valid values)" do
          it "is valid" do
            @test.flags = { :a => "1", :b => "1", :c => '', :d => '', :e => '' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '', :e => '' } (3 valid values)" do
          it "is valid" do
            @test.flags = { :a => "1", :b => "1", :c => "1", :d => '', :e => '' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '' } (4 valid values)" do
          it "is invalid" do
            @test.flags = { :a => "1", :b => "1", :c => "1", :d => "1", :e => '' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '1' } (all valid values)" do
          it "is invalid" do
            @test.flags = { :a => "1", :b => "1", :c => "1", :d => "1", :e => "1" }
            expect(@test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}
  end

  describe "error message" do
    context "when given no option" do# {{{
      before do
        @test = AnyAcceptanceTest.new
      end

      context "when valid" do
        before do
          @test.flags = ['1', '1', '']
          @test.valid?
        end

        it "has no message" do
          expect(@test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          @test.flags = ['', "", "   "]
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with flags attribute" do
          expect(@test.errors.include?(:flags)).to eq true
        end
        it %q{error messsage is "Flags must be accepted required number (1-)"} do
          expect(@test.errors.full_messages.first).to eq "Flags must be accepted required number (1-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.flags = ['', "", "   "]
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Flags は指定件数(1～)承諾してください"
        end
      end
    end# }}}

    context "when given :min_valid_count option" do# {{{
      before do
        @test = AnyAcceptanceTestWithMinValidCountOnly.new
      end

      context "when invalid" do
        before do
          @test.flags = ["1", "", "   "]
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with flags attribute" do
          expect(@test.errors.include?(:flags)).to eq true
        end
        it %q{error messsage is "Flags must be accepted required number (2-)"} do
          expect(@test.errors.full_messages.first).to eq "Flags must be accepted required number (2-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.flags = ["1", "", "   "]
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Flags は指定件数(2～)承諾してください"
        end
      end
    end# }}}

    context "when given :max_valid_count option" do# {{{
      before do
        @test = AnyAcceptanceTestWithMaxValidCountOnly.new
      end

      context "when invalid" do
        before do
          @test.flags = ["1", "1", "1", "1", '']
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with flags attribute" do
          expect(@test.errors.include?(:flags)).to eq true
        end
        it %q{error messsage is "Flags must be accepted required number (1-3)"} do
          expect(@test.errors.full_messages.first).to eq "Flags must be accepted required number (1-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.flags = ["1", "1", "1", "1", '']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Flags は指定件数(1～3)承諾してください"
        end
      end
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      before do
        @test = AnyAcceptanceTestWithBothValidCount.new
      end

      context "when invalid" do
        before do
          @test.flags = ["1", "1", "1", "1", '']
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with flags attribute" do
          expect(@test.errors.include?(:flags)).to eq true
        end
        it %q{error messsage is "Flags must be accepted required number (2-3)"} do
          expect(@test.errors.full_messages.first).to eq "Flags must be accepted required number (2-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.flags = ["1", "1", "1", "1", '']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Flags は指定件数(2～3)承諾してください"
        end
      end
    end# }}}

    context "when given message option" do# {{{
      before do
        @test = AnyAcceptanceTestWithMessageOption.new
      end
      context "when invalid" do
        before do
          @test.flags = ['', "", "   "]
          @test.valid?
        end
        it "error messsage uses given message" do
          expect(@test.errors.full_messages.first).to eq "Flags is invalid"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.flags = ['', "", "   "]
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is not translated" do
          expect(@test.errors.full_messages.first).to eq "Flags is invalid"
        end
      end
    end# }}}
  end
end

