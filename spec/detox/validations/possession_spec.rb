# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/possession_test"

describe Detox::Validations::PossessionValidator do
  describe "validation result" do
    context "when given no option" do
      it "raise ArgumentError" do
        expect do
          class PossessionTestWithoutOption < ModelBase
            attr_accessor :values

            validates :values, :possession => true
          end
        end.to raise_error(ArgumentError, ":target must be supplied")
      end
    end

    context "when given :target option" do
      context "when target is single value (target is '3')" do# {{{
        before do
          @test = PossessionTestWithSingleTarget.new
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
          context "when apply to ['1', '2', '3'] (contains target)" do
            it "is valid" do
              @test.values = ["1", "2", "3"]
              expect(@test.valid?).to eq true
            end
          end
          context "when apply to ['1', '2', '4'] (doesn't contain target)" do
            it "is invalid" do
              @test.values = ['1', '2', '4']
              expect(@test.valid?).to eq false
            end
          end
        end# }}}

        context "when apply to Hash" do# {{{
          context "when apply to {} (empty)" do
            it "is valid" do
              @test.values = []
              expect(@test.valid?).to eq true
            end
          end
          context "when apply to { :a => '1', :b => '2', :c => '3' } (contains target)" do
            it "is valid" do
              @test.values = { :a => '1', :b => '2', :c => '3' }
              expect(@test.valid?).to eq true
            end
          end
          context "when apply to { :a => '1', :b => '2', :c => '4' } (doesn't contain target)" do
            it "is invalid" do
              @test.values = { :a => '1', :b => '2', :c => '4' }
              expect(@test.valid?).to eq false
            end
          end
        end# }}}
      end# }}}

      context "when target is multi values (target are '2' and '3')" do# {{{
        before do
          @test = PossessionTestWithArrayTarget.new
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
          context "when apply to ['1', '2', '3'] (contains both target)" do
            it "is valid" do
              @test.values = ["1", "2", "3"]
              expect(@test.valid?).to eq true
            end
          end
          context "when apply to ['1', '2', '4'] (contains target partialy)" do
            it "is invalid" do
              @test.values = ['1', '2', '4']
              expect(@test.valid?).to eq false
            end
          end
          context "when apply to ['1', '0', '4'] (doesn't contain each target)" do
            it "is invalid" do
              @test.values = ['1', '0', '4']
              expect(@test.valid?).to eq false
            end
          end
        end# }}}

        context "when apply to Hash" do# {{{
          context "when apply to {} (empty)" do
            it "is valid" do
              @test.values = []
              expect(@test.valid?).to eq true
            end
          end
          context "when apply to { :a => '1', :b => '2', :c => '3' } (contains both target)" do
            it "is valid" do
              @test.values = { :a => '1', :b => '2', :c => '3' }
              expect(@test.valid?).to eq true
            end
          end
          context "when apply to { :a => '1', :b => '2', :c => '4' } (contains target partialy)" do
            it "is invalid" do
              @test.values = { :a => '1', :b => '2', :c => '4' }
              expect(@test.valid?).to eq false
            end
          end
          context "when apply to { :a => '1', :b => '0', :c => '4' } (doesn't contain each target)" do
            it "is invalid" do
              @test.values = { :a => '1', :b => '0', :c => '4' }
              expect(@test.valid?).to eq false
            end
          end
        end# }}}
      end# }}}
    end
  end

  describe "error message" do
    context "when target is single value (target is '3')" do# {{{
      before do
        @test = PossessionTestWithSingleTarget.new
      end

      context "when valid" do
        before do
          @test.values = ['1', '2', '3']
          @test.valid?
        end

        it "has no message" do
          expect(@test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          @test.values = ['1', '2', '4']
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(@test.errors.include?(:values)).to eq true
        end
        it "error messsage is 'Values must possess target (target: 3)'" do
          expect(@test.errors.full_messages.first).to eq "Values must possess target (target: 3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.values = ['1', '2', '4']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Values には対象(3)が含まれている必要があります"
        end
      end
    end# }}}

    context "when target is multi values (target are '2' and '3')" do# {{{
      before do
        @test = PossessionTestWithArrayTarget.new
      end

      context "when valid" do
        before do
          @test.values = ['1', '2', '3']
          @test.valid?
        end

        it "has no message" do
          expect(@test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          @test.values = ['1', '2', '4']
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(@test.errors.include?(:values)).to eq true
        end
        it "error messsage is 'Values must possess target (target: 2, 3)'" do
          expect(@test.errors.full_messages.first).to eq "Values must possess target (target: 2, 3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.values = ['1', '2', '4']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Values には対象(2, 3)が含まれている必要があります"
        end
      end
    end# }}}

    context "when given message option" do# {{{
      before do
        @test = PossessionTestWithMessageOption.new
      end
      context "when invalid" do
        before do
          @test.values = ['1', '2', '4']
          @test.valid?
        end
        it "error messsage uses given message" do
          expect(@test.errors.full_messages.first).to eq "Values is invalid"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.values = ['1', '2', '4']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is not translated" do
          expect(@test.errors.full_messages.first).to eq "Values is invalid"
        end
      end
    end# }}}
  end
end

