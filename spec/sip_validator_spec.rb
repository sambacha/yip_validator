RSpec.describe SipValidator do
  it "has a version number" do
    expect(SipValidator::VERSION).not_to be nil
  end

  it "raises exception if it includes invalid sips" do
    expect{
      SipValidator::Runner.run Dir["spec/fixtures/valid/*md"]
    }.not_to raise_error
  end

  it "raises exception if it includes invalid sips" do
    expect{
      SipValidator::Runner.run Dir["spec/fixtures/invalid/*md"]
    }.to raise_error
  end
end
