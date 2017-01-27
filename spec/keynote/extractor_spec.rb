require "spec_helper"

describe Keynote::Extractor do
  it "has a version number" do
    expect(Keynote::Extractor::VERSION).not_to be nil
  end

  it "returns text from keynote presentation" do
    expect(Keynote::Extractor::Parse.file()).to eq('file')
  end
end
