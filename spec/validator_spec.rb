require 'spec_helper'

RSpec.describe "SipValidator::Validator"  do
  let(:status) { 'Implemented' }
  
  let(:sip){
    {
      sip: 7,
      title: 'Oracle Trading Locks',
      author: 'Jackson Chan, Kain Warwick, Clinton Ennis',
      status: status,
      created: '2019-07-09'
    }
  }
  subject(:validator){ SipValidator::Validator.new(sip)}

  describe "valid" do
    it "should have required fields" do
      expect(validator.valid?).to eq true
    end
  end

  describe "missing fields" do
    it "raise error if required fields are missing" do
      expect(SipValidator::Validator.new().valid?).to eq false
    end
  end

  describe "wrong status" do
    let(:status) { 'Foo'}
    it "raise error if required fields are missing" do
      expect(validator.valid?).to eq false
      expect(validator.errors[:status].first).to eq 'is not included in the list'
    end
  end

  describe "attribute with -" do
    it "is valid if specified" do
      SipValidator::Validator.new(sip.merge({'discussions-to':'something'}))
    end
 
    it "not valid if not specified" do
      expect{
        SipValidator::Validator.new(sip.merge({'how-to':'something'}))
      }.to raise_error(/unknown attribute/)
    end
  end

  describe "attribute with _" do
    it "not valid" do
      expect{
        SipValidator::Validator.new(sip.merge({'discussions_to':'something'}))
      }.to raise_error("discussions_to incude _ which is not allowed")
    end
  end
end