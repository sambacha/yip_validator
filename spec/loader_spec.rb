require 'spec_helper'

RSpec.describe "SipValidator::Loader"  do
  let(:status) { 'Implemented' }
  let(:sip){
    {
      "sip" => 7,
      "title" => 'Oracle Trading Locks',
      "author" => 'Jackson Chan, Kain Warwick, Clinton Ennis',
      "status" => status,
      "created" => Date.parse('2019-07-09')
    }
  }
  let(:file_name) {
   'spec/fixtures/valid/sip-7.md'
  }

  subject(:loader){ SipValidator::Loader.load(file_name)}

  describe "valid" do
    it "should have required fields" do
      expect(loader).to eq(sip)
    end
  end
end