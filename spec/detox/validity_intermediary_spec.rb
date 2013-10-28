# coding: utf-8
require "spec_helper"
require "detox/validity_intermediary"

describe Detox::ValidityIntermediary do
  before do
    @holder = Detox::ValidityIntermediary.new
  end

  describe "#errors" do
    context "when initialized" do
      it "not nil" do
        expect(@holder.errors).not_to be_nil
      end
      it "responds to :add" do
        expect(@holder.errors.respond_to?(:add)).to eq true
      end
      it "respond to :clear" do
        expect(@holder.errors.respond_to?(:clear)).to eq true
      end
    end
  end

  describe "#valid?" do
    context "when initialized" do
      it "returns true" do
        expect(@holder.valid?).to eq true
      end
    end
    context "when errors.add called" do
      before do
        @holder.errors.add("attr", "message")
      end
      it "returns false" do
        expect(@holder.valid?).to eq false
      end
      it "restore to valid" do
        expect(@holder.valid?).to eq false
        expect(@holder.valid?).to eq true
      end
    end
    context "when errors.clear called on holding invalidity" do
      before do
        @holder.errors.add("attr", "message")
        @holder.errors.clear
      end
      it "returns true" do
        expect(@holder.valid?).to eq true
      end
    end
  end

  describe "#invalid?" do
    context "when initialized" do
      it "returns false" do
        expect(@holder.invalid?).to eq false
      end
    end
    context "when errors.add called" do
      before do
        @holder.errors.add("attr", "message")
      end
      it "returns false" do
        expect(@holder.invalid?).to eq true
      end
      it "restore to valid" do
        expect(@holder.invalid?).to eq true
        expect(@holder.invalid?).to eq false
      end
    end
    context "when errors.clear called on holding invalidity" do
      before do
        @holder.errors.add("attr", "message")
        @holder.errors.clear
      end
      it "returns false" do
        expect(@holder.invalid?).to eq false
      end
    end
  end

  describe "#validitize" do
    context "when holding validity" do
      before do
        @holder.validitize
      end
      it "validity is not same" do
        expect(@holder.valid?).to eq true
      end
    end
    context "when holding invalidity" do
      before do
        @holder.errors.add("attr", "message")
        @holder.validitize
      end
      it "change to valid" do
        expect(@holder.valid?).to eq true
      end
    end
  end

  describe "#invaliditize" do
    context "when holding validity" do
      before do
        @holder.invaliditize
      end
      it "change to invalid" do
        expect(@holder.invalid?).to eq true
      end
    end
    context "when holding invalidity" do
      before do
        @holder.errors.add("attr", "message")
        @holder.invaliditize
      end
      it "validity is not same" do
        expect(@holder.valid?).to eq false
      end
    end
  end
end
