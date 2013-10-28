# coding: utf-8
require "spec_helper"
require "detox/validity_broker"

describe Detox::ValidityBroker do
  before do
    @broker = Detox::ValidityBroker.new
  end

  describe "#errors" do
    context "when initialized" do
      it "not nil" do
        expect(@broker.errors).not_to be_nil
      end
      it "responds to :add" do
        expect(@broker.errors.respond_to?(:add)).to eq true
      end
      it "respond to :clear" do
        expect(@broker.errors.respond_to?(:clear)).to eq true
      end
    end
  end

  describe "#valid?" do
    context "when initialized" do
      it "returns true" do
        expect(@broker.valid?).to eq true
      end
    end
    context "when errors.add called" do
      before do
        @broker.errors.add("attr", "message")
      end
      it "returns false" do
        expect(@broker.valid?).to eq false
      end
      it "restore to valid" do
        expect(@broker.valid?).to eq false
        expect(@broker.valid?).to eq true
      end
    end
    context "when errors.add_on_blank called" do
      before do
        @broker.errors.add_on_blank("attr", "message")
      end
      it "returns false" do
        expect(@broker.valid?).to eq false
      end
      it "restore to valid" do
        expect(@broker.valid?).to eq false
        expect(@broker.valid?).to eq true
      end
    end
    context "when errors.clear called on holding invalidity" do
      before do
        @broker.errors.add("attr", "message")
        @broker.errors.clear
      end
      it "returns true" do
        expect(@broker.valid?).to eq true
      end
    end
  end

  describe "#invalid?" do
    context "when initialized" do
      it "returns false" do
        expect(@broker.invalid?).to eq false
      end
    end
    context "when errors.add called" do
      before do
        @broker.errors.add("attr", "message")
      end
      it "returns false" do
        expect(@broker.invalid?).to eq true
      end
      it "restore to valid" do
        expect(@broker.invalid?).to eq true
        expect(@broker.invalid?).to eq false
      end
    end
    context "when errors.clear called on holding invalidity" do
      before do
        @broker.errors.add("attr", "message")
        @broker.errors.clear
      end
      it "returns false" do
        expect(@broker.invalid?).to eq false
      end
    end
  end

  describe "#validitize" do
    context "when holding validity" do
      before do
        @broker.validitize
      end
      it "validity is not same" do
        expect(@broker.valid?).to eq true
      end
    end
    context "when holding invalidity" do
      before do
        @broker.errors.add("attr", "message")
        @broker.validitize
      end
      it "change to valid" do
        expect(@broker.valid?).to eq true
      end
    end
  end

  describe "#invaliditize" do
    context "when holding validity" do
      before do
        @broker.invaliditize
      end
      it "change to invalid" do
        expect(@broker.invalid?).to eq true
      end
    end
    context "when holding invalidity" do
      before do
        @broker.errors.add("attr", "message")
        @broker.invaliditize
      end
      it "validity is not same" do
        expect(@broker.valid?).to eq false
      end
    end
  end
end
