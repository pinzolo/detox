# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/all_acceptance_test"

describe Detox::Validations::AllAcceptanceValidator do
  describe "validation result" do
    context "when given no additional option" do# {{{
      let(:test) { AllAcceptanceTest.new }

      context "when apply to nil" do
        it "is valid" do
          test.flags = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.flags = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1'] (valid flags)" do
          it "is valid" do
            test.flags = ["1", "1", "1"]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '4'] (contains invalid value)" do
          it "is invalid" do
            test.flags = ["1", "1", "4"]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '1', nil] (contains nil)" do
          it "is valid" do
            test.flags = ['1', '1', nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', ''] (contains empty)" do
          it "is invalid" do
            test.flags = ['1', '1', '']
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '1', '   '] (contains blank)" do
          it "is invalid" do
            test.flags = ['1', '1', '   ']
            expect(test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.flags = {}
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1' } (valid flags)" do
          it "is valid" do
            test.flags = { :a => '1', :b => '1', :c => '1' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '4' } (contains invalid value)" do
          it "is invalid" do
            test.flags = { :a => '1', :b => '1', :c => '4' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => nil } (contains nil)" do
          it "is valid" do
            test.flags = { :a => '1', :b => '1', :c => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '' } (contains empty)" do
          it "is invalid" do
            test.flags = { :a => '1', :b => '1', :c => '' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '   ' } (contains blank)" do
          it "is invalid" do
            test.flags = { :a => '1', :b => '1', :c => '   ' }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given ignore_nil_value option" do# {{{
      let(:test) { AllAcceptanceTestWithIgnoreNilValueOption.new }

      context "when apply to nil" do
        it "is valid" do
          test.flags = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.flags = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1'] (valid flags)" do
          it "is valid" do
            test.flags = ["1", "1", "1"]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '4'] (contains invalid flags)" do
          it "is invalid" do
            test.flags = ["1", "1", "4"]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '1', nil] (contains nil)" do
          it "is valid" do
            test.flags = ['1', '1', nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', ''] (contains empty)" do
          it "is invalid" do
            test.flags = ['1', '1', '']
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '1', '   '] (contains blank)" do
          it "is invalid" do
            test.flags = ['1', '1', '   ']
            expect(test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.flags = {}
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1' } (valid flags)" do
          it "is valid" do
            test.flags = { :a => '1', :b => '1', :c => '1' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '4' } (contains invalid flags)" do
          it "is invalid" do
            test.flags = { :a => '1', :b => '1', :c => '4' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => nil } (contains nil)" do
          it "is valid" do
            test.flags = { :a => '1', :b => '1', :c => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '' } (contains empty)" do
          it "is invalid" do
            test.flags = { :a => '1', :b => '1', :c => '' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '   ' } (contains blank)" do
          it "is invalid" do
            test.flags = { :a => '1', :b => '1', :c => '   ' }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given ignore_blank_value option" do# {{{
      let(:test) { AllAcceptanceTestWithIgnoreBlankValueOption.new }

      context "when apply to nil" do
        it "is valid" do
          test.flags = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.flags = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1'] (valid flags)" do
          it "is valid" do
            test.flags = ["1", "1", "1"]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '4'] (contains invalid flags)" do
          it "is invalid" do
            test.flags = ["1", "1", "4"]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '1', nil] (contains nil)" do
          it "is valid" do
            test.flags = ['1', '1', nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', ''] (contains empty)" do
          it "is valid" do
            test.flags = ['1', '1', '']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '   '] (contains blank)" do
          it "is valid" do
            test.flags = ['1', '1', '   ']
            expect(test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.flags = {}
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1' } (valid flags)" do
          it "is valid" do
            test.flags = { :a => '1', :b => '1', :c => '1' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '4' } (contains invalid flags)" do
          it "is invalid" do
            test.flags = { :a => '1', :b => '1', :c => '4' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => nil } (contains nil)" do
          it "is valid" do
            test.flags = { :a => '1', :b => '1', :c => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '' } (contains empty)" do
          it "is valid" do
            test.flags = { :a => '1', :b => '1', :c => '' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '   ' } (contains blank)" do
          it "is valid" do
            test.flags = { :a => '1', :b => '1', :c => '   ' }
            expect(test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}
  end

  describe "error message" do
    context "when without message option" do# {{{
      let(:test) { AllAcceptanceTest.new }

      context "when valid" do
        before do
          test.flags = ['1', '1', '1']
          test.valid?
        end

        it "has no message" do
          expect(test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          test.flags = ['1', '1', '4']
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with flags attribute" do
          expect(test.errors.include?(:flags)).to eq true
        end
        it %q{error messsage is "Flags must be all accepted"} do
          expect(test.errors.full_messages.first).to eq "Flags must be all accepted"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.flags = ['1', '1', '4']
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Flags を全て承諾してください"
        end
      end
    end# }}}

    context "when given message option" do# {{{
      let(:test) { AllAcceptanceTestWithMessageOption.new }

      context "when invalid" do
        before do
          test.flags = ['1', '1', '4']
          test.valid?
        end
        it "error messsage uses given message" do
          expect(test.errors.full_messages.first).to eq 'Flags is invalid'
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.flags = ['1', '1', '4']
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is not translated" do
          expect(test.errors.full_messages.first).to eq 'Flags is invalid'
        end
      end
    end# }}}
  end
end

