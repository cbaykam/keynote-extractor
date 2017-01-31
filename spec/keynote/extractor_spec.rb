require "spec_helper"

describe Keynote::Extractor do
  it "has a version number" do
    expect(Keynote::Extractor::VERSION).not_to be nil
  end

  it "returns text from keynote presentation" do
    file = file = File.expand_path("spec/support/whydots.key", Dir.pwd)
    file_text = Keynote::Extractor::Parse.text(file)
    expect(file_text).to include('president')
    expect(file_text).to include('greenhouse gas')
  end

  it "returns all iwa files from larger new keynote presentations" do 
    file = file = File.expand_path("spec/support/process.key", Dir.pwd)
    file_text = Keynote::Extractor::Parse.text(file)
  end 
end
