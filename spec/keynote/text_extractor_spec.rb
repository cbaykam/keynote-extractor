require 'spec_helper'
require 'keynote/extractor/text_extractor'

describe Keynote::Extractor::TextExtractor do
  it "parses text from extracted archive" do 
    file = File.open(File.expand_path("spec/support/index.apxl", Dir.pwd), 'rb')
    content = file.read 

    file_text = Keynote::Extractor::TextExtractor.get_text(content)
    expect(file_text).to include('president')
    expect(file_text).to include('by: jeff monday')
  end
end 