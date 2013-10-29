# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/ordering_test"

describe Detox::Validations::OrderingValidator do
  describe "validation result" do
    context "when given no option" do# {{{
      before do
        @test = OrderingTestWithoutOption.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.seq = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.seq = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3'] (valid as order, sequencial)" do
          it "is valid" do
            @test.seq = ["1", "2", "3"]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['2', '3', '1'] (valid as order, not sequencial)" do
          it "is valid" do
            @test.seq = ["2", "3", "1"]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '4'] (invalid as order)" do
          it "is invalid" do
            @test.seq = ['1', '2', '4']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', nil, '3'] (contains nil)" do
          it "is invalid" do
            @test.seq = ['1', '2', nil, '3']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', '', '3'] (contains empty)" do
          it "is invalid" do
            @test.seq = ['1', '2', '', '3']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', '   ', '3'] (contains blank)" do
          it "is invalid" do
            @test.seq = ['1', '2', '   ', '3']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to [1, 2, 3] (number values)" do
          it "is valid" do
            @test.seq = [1, 2, 3]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to [2, 3, 4] (origin is not 1)" do
          it "is invalid" do
            @test.seq = [2, 3, 4]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', '1'] (contains duplicative value)" do
          it "is invalid" do
            @test.seq = ["1", "2", "1"]
            expect(@test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.seq = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '2', :b => '3', :c => '1' } (valid as order)" do
          it "is valid" do
            @test.seq = { :a => '2', :b => '3', :c => '1' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '4' } (invalid as order)" do
          it "is invalid" do
            @test.seq = { :a => '1', :b => '2', :c => '4' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => nil, :d => '3' } (contains nil)" do
          it "is invalid" do
            @test.seq = { :a => '1', :b => '2', :c => nil, :d => '3' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '', :d => '3' } (contains empty)" do
          it "is invalid" do
            @test.seq = { :a => '1', :b => '2', :c => '', :d => '3' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '   ', :d => '3' } (contains blank)" do
          it "is invalid" do
            @test.seq = { :a => '1', :b => '2', :c => '   ', :d => '3' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => 2, :b => 3, :c => 1 } (number values)" do
          it "is valid" do
            @test.seq = { :a => 2, :b => 3, :c => 1 }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '2', :b => '3', :c => '4' } (origin is not 1)" do
          it "is invalid" do
            @test.seq = { :a => '2', :b => '3', :c => '4' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '1' } (contains duplicative value)" do
          it "is invalid" do
            @test.seq = { :a => '1', :b => '2', :c => '1' }
            expect(@test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given ignore_nil_value option" do# {{{
      before do
        @test = OrderingTestWithIgnoreNilValueOption.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.seq = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.seq = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['2', '3', '1'] (valid as order, not sequencial)" do
          it "is valid" do
            @test.seq = ["2", "3", "1"]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '4'] (invalid as order)" do
          it "is invalid" do
            @test.seq = ['1', '2', '4']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', nil, '3'] (contains nil)" do
          it "is valid" do
            @test.seq = ['1', '2', '3']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '', '3'] (contains empty)" do
          it "is invalid" do
            @test.seq = ['1', '2', '', '3']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', '   ', '3'] (contains blank)" do
          it "is invalid" do
            @test.seq = ['1', '2', '   ', '3']
            expect(@test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.seq = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '2', :b => '3', :c => '1' } (valid as order)" do
          it "is valid" do
            @test.seq = { :a => '2', :b => '3', :c => '1' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '4' } (invalid as order)" do
          it "is invalid" do
            @test.seq = { :a => '1', :b => '2', :c => '4' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => nil, :d => '3' } (contains nil)" do
          it "is valid" do
            @test.seq = { :a => '1', :b => '2', :c => nil, :d => '3' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '', :d => '3' } (contains empty)" do
          it "is invalid" do
            @test.seq = { :a => '1', :b => '2', :c => '', :d => '3' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '   ', :d => '3' } (contains blank)" do
          it "is invalid" do
            @test.seq = { :a => '1', :b => '2', :c => '   ', :d => '3' }
            expect(@test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given ignore_blank_value option" do# {{{
      before do
        @test = OrderingTestWithIgnoreBlankValueOption.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.seq = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.seq = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3'] (valid as order, sequencial)" do
          it "is valid" do
            @test.seq = ["1", "2", "3"]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['2', '3', '1'] (valid as order, not sequencial)" do
          it "is valid" do
            @test.seq = ["2", "3", "1"]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '4'] (invalid as order)" do
          it "is invalid" do
            @test.seq = ['1', '2', '4']
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', nil, '3'] (contains nil)" do
          it "is valid" do
            @test.seq = ['1', '2', '3']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '', '3'] (contains empty)" do
          it "is valid" do
            @test.seq = ['1', '2', '', '3']
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '   ', '3'] (contains blank)" do
          it "is valid" do
            @test.seq = ['1', '2', '   ', '3']
            expect(@test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.seq = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '2', :b => '3', :c => '1' } (valid as order)" do
          it "is valid" do
            @test.seq = { :a => '2', :b => '3', :c => '1' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '4' } (invalid as order)" do
          it "is invalid" do
            @test.seq = { :a => '1', :b => '2', :c => '4' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => nil, :d => '3' } (contains nil)" do
          it "is valid" do
            @test.seq = { :a => '1', :b => '2', :c => nil, :d => '3' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '', :d => '3' } (contains empty)" do
          it "is valid" do
            @test.seq = { :a => '1', :b => '2', :c => '', :d => '3' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '   ', :d => '3' } (contains blank)" do
          it "is valid" do
            @test.seq = { :a => '1', :b => '2', :c => '   ', :d => '3' }
            expect(@test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given start_with option" do# {{{
      before do
        @test = OrderingTestWithStartWithOption.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.seq = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.seq = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['2', '3', '1'] (origin is 1)" do
          it "is invalid" do
            @test.seq = ["2", "3", "1"]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['4', '3', '5'] (origin is 3)" do
          it "is valid" do
            @test.seq = ["4", "3", "5"]
            expect(@test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.seq = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => '2', :b => '3', :c => '1' } (origin is 1)" do
          it "is invalid" do
            @test.seq = { :a => '2', :b => '3', :c => '1' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => '4', :b => '3', :c => '5' } (origin is 3)" do
          it "is valid" do
            @test.seq = { :a => '4', :b => '3', :c => '5' }
            expect(@test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}
  end

  describe "error message" do
    context "when given no option" do# {{{
      before do
        @test = OrderingTestWithoutOption.new
      end

      context "when valid" do
        before do
          @test.seq = ['1', '2', '3']
          @test.valid?
        end

        it "has no message" do
          expect(@test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          @test.seq = ['1', '2', '4']
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with seq attribute" do
          expect(@test.errors.include?(:seq)).to eq true
        end
        it "error messsage is 'Seq is not satisfied as order'" do
          expect(@test.errors.full_messages.first).to eq 'Seq is not satisfied as order'
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.seq = ['1', '2', '4']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq 'Seq は順序として成立していません'
        end
      end
    end# }}}

    context "when given message option" do# {{{
      before do
        @test = OrderingTestWithMessageOption.new
      end
      context "when invalid" do
        before do
          @test.seq = ['1', '2', '4']
          @test.valid?
        end
        it "error messsage uses given message" do
          expect(@test.errors.full_messages.first).to eq 'Seq contains invalid sequence'
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.seq = ['1', '2', '4']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is not translated" do
          expect(@test.errors.full_messages.first).to eq 'Seq contains invalid sequence'
        end
      end
    end# }}}
  end
end
