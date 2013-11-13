# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/values_uniqueness_test"

describe Detox::Validations::ValuesUniquenessValidator do
  describe "validation result" do
    context "when given no option" do# {{{
      let(:test) { ValuesUniquenessTestWithoutOption.new }

      context "when apply to nil" do
        it "is valid" do
          test.seq = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.seq = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3'] (no duplicate value, nil, empty and blank)" do
          it "is valid" do
            test.seq = ["1", "2", "3"]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '3', '1'] (contains duplicate value)" do
          it "is invalid" do
            test.seq = ["1", "3", "1"]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', nil, '3'] (no duplicate value but contains nil)" do
          it "is valid" do
            test.seq = ['1', '2', nil, '3']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', nil, '3', nil] (contains 2 nil)" do
          it "is invalid" do
            test.seq = ['1', '2', nil, '3', nil]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', '', '3'] (no duplicate value but contains empty)" do
          it "is valid" do
            test.seq = ['1', '2', "", '3']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '', '3', ''] (contains 2 empty)" do
          it "is invalid" do
            test.seq = ['1', '2', "", '3', ""]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', '   ', '3'] (no duplicate value but contains blank)" do
          it "is valid" do
            test.seq = ['1', '2', "   ", '3']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '   ', '3', '   '] (contains 2 blank)" do
          it "is invalid" do
            test.seq = ['1', '2', "   ", '3', "   "]
            expect(test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.seq = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '2', :b => '3', :c => '1' } (no duplicate value, nil, empty and blank)" do
          it "is valid" do
            test.seq = { :a => '2', :b => '3', :c => '1' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '1' } (contains duplicate value)" do
          it "is invalid" do
            test.seq = { :a => '1', :b => '2', :c => '1' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => nil, :d => '3' } (no duplicate value but contains nil)" do
          it "is valid" do
            test.seq = { :a => '1', :b => '2', :c => nil, :d => '3' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => nil, :d => '3', :e => nil } (contains 2 nil)" do
          it "is invalid" do
            test.seq = { :a => '1', :b => '2', :c => nil, :d => '3', :e => nil }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '', :d => '3' } (no duplicate value but contains empty)" do
          it "is valid" do
            test.seq = { :a => '1', :b => '2', :c => '', :d => '3' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '', :d => '3', :e => '' } (contains 2 empty)" do
          it "is invalid" do
            test.seq = { :a => '1', :b => '2', :c => '', :d => '3', :e => '' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '   ', :d => '3' } (no duplicate value but contains blank)" do
          it "is valid" do
            test.seq = { :a => '1', :b => '2', :c => '   ', :d => '3' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '   ', :d => '3', :e => '   ' } (contains 2 blank)" do
          it "is invalid" do
            test.seq = { :a => '1', :b => '2', :c => '   ', :d => '3', :e => '   ' }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given ignore_nil_value option" do# {{{
      let(:test) { ValuesUniquenessTestWithIgnoreNilValueOption.new }

      context "when apply to nil" do
        it "is valid" do
          test.seq = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.seq = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3'] (no duplicate value, nil, empty and blank)" do
          it "is valid" do
            test.seq = ["1", "2", "3"]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '3', '1'] (contains duplicate value)" do
          it "is invalid" do
            test.seq = ["1", "3", "1"]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', nil, '3'] (no duplicate value but contains nil)" do
          it "is valid" do
            test.seq = ['1', '2', nil, '3']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', nil, '3', nil] (contains 2 nil)" do
          it "is valid" do
            test.seq = ['1', '2', nil, '3', nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '', '3'] (no duplicate value but contains empty)" do
          it "is valid" do
            test.seq = ['1', '2', "", '3']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '', '3', ''] (contains 2 empty)" do
          it "is invalid" do
            test.seq = ['1', '2', "", '3', ""]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', '   ', '3'] (no duplicate value but contains blank)" do
          it "is valid" do
            test.seq = ['1', '2', "   ", '3']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '   ', '3', '   '] (contains 2 blank)" do
          it "is invalid" do
            test.seq = ['1', '2', "   ", '3', "   "]
            expect(test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.seq = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '2', :b => '3', :c => '1' } (no duplicate value, nil, empty and blank)" do
          it "is valid" do
            test.seq = { :a => '2', :b => '3', :c => '1' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '1' } (contains duplicate value)" do
          it "is invalid" do
            test.seq = { :a => '1', :b => '2', :c => '1' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => nil, :d => '3' } (no duplicate value but contains nil)" do
          it "is valid" do
            test.seq = { :a => '1', :b => '2', :c => nil, :d => '3' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => nil, :d => '3', :e => nil } (contains 2 nil)" do
          it "is valid" do
            test.seq = { :a => '1', :b => '2', :c => nil, :d => '3', :e => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '', :d => '3' } (no duplicate value but contains empty)" do
          it "is valid" do
            test.seq = { :a => '1', :b => '2', :c => '', :d => '3' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '', :d => '3', :e => '' } (contains 2 empty)" do
          it "is invalid" do
            test.seq = { :a => '1', :b => '2', :c => '', :d => '3', :e => '' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '   ', :d => '3' } (no duplicate value but contains blank)" do
          it "is valid" do
            test.seq = { :a => '1', :b => '2', :c => '   ', :d => '3' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '   ', :d => '3', :e => '   ' } (contains 2 blank)" do
          it "is invalid" do
            test.seq = { :a => '1', :b => '2', :c => '   ', :d => '3', :e => '   ' }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given ignore_blank_value option" do# {{{
      let(:test) { ValuesUniquenessTestWithIgnoreBlankValueOption.new }

      context "when apply to nil" do
        it "is valid" do
          test.seq = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.seq = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3'] (no duplicate value, nil, empty and blank)" do
          it "is valid" do
            test.seq = ["1", "2", "3"]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '3', '1'] (contains duplicate value)" do
          it "is invalid" do
            test.seq = ["1", "3", "1"]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', nil, '3'] (no duplicate value but contains nil)" do
          it "is valid" do
            test.seq = ['1', '2', nil, '3']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', nil, '3', nil] (contains 2 nil)" do
          it "is valid" do
            test.seq = ['1', '2', nil, '3', nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '', '3'] (no duplicate value but contains empty)" do
          it "is valid" do
            test.seq = ['1', '2', "", '3']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '', '3', ''] (contains 2 empty)" do
          it "is valid" do
            test.seq = ['1', '2', "", '3', ""]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '   ', '3'] (no duplicate value but contains blank)" do
          it "is valid" do
            test.seq = ['1', '2', "   ", '3']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '   ', '3', '   '] (contains 2 blank)" do
          it "is valid" do
            test.seq = ['1', '2', "   ", '3', "   "]
            expect(test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.seq = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '2', :b => '3', :c => '1' } (no duplicate value, nil, empty and blank)" do
          it "is valid" do
            test.seq = { :a => '2', :b => '3', :c => '1' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '1' } (contains duplicate value)" do
          it "is invalid" do
            test.seq = { :a => '1', :b => '2', :c => '1' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => nil, :d => '3' } (no duplicate value but contains nil)" do
          it "is valid" do
            test.seq = { :a => '1', :b => '2', :c => nil, :d => '3' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => nil, :d => '3', :e => nil } (contains 2 nil)" do
          it "is valid" do
            test.seq = { :a => '1', :b => '2', :c => nil, :d => '3', :e => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '', :d => '3' } (no duplicate value but contains empty)" do
          it "is valid" do
            test.seq = { :a => '1', :b => '2', :c => '', :d => '3' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '', :d => '3', :e => '' } (contains 2 empty)" do
          it "is valid" do
            test.seq = { :a => '1', :b => '2', :c => '', :d => '3', :e => '' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '   ', :d => '3' } (no duplicate value but contains blank)" do
          it "is valid" do
            test.seq = { :a => '1', :b => '2', :c => '   ', :d => '3' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '   ', :d => '3', :e => '   ' } (contains 2 blank)" do
          it "is valid" do
            test.seq = { :a => '1', :b => '2', :c => '   ', :d => '3', :e => '   ' }
            expect(test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}
  end

  describe "error message" do
    context "when given no option" do# {{{
      let(:test) { ValuesUniquenessTestWithoutOption.new }

      context "when valid" do
        before do
          test.seq = ['1', '2', '3']
          test.valid?
        end

        it "has no message" do
          expect(test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          test.seq = ['1', '2', '1']
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with seq attribute" do
          expect(test.errors.include?(:seq)).to eq true
        end
        it "error messsage is 'Seq contains duplicate value'" do
          expect(test.errors.full_messages.first).to eq 'Seq contains duplicate value'
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.seq = ['1', '2', '1']
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq 'Seq は重複する値を含んでいます'
        end
      end
    end# }}}

    context "when given message option" do# {{{
      let(:test) { ValuesUniquenessTestWithMessageOption.new }

      context "when invalid" do
        before do
          test.seq = ['1', '2', '1']
          test.valid?
        end
        it "error messsage uses given message" do
          expect(test.errors.full_messages.first).to eq 'Seq is invalid'
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.seq = ['1', '2', '1']
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is not translated" do
          expect(test.errors.full_messages.first).to eq 'Seq is invalid'
        end
      end
    end# }}}
  end
end

