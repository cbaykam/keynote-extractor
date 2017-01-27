require 'spec_helper'
require 'keynote/extractor/archive_extractor'

describe Keynote::Extractor::ArchiveExtractor do 
  it "extracts a keynote file as a zip archive and returns text" do
    file = File.expand_path("spec/support/whydots.key", Dir.pwd)
    expect(Keynote::Extractor::ArchiveExtractor.return_index(file)).to include('M 0 0 L 762.578125 0 L 762.578125 352 L 0 352 Z M 0 0"/></sf:bezier-path></sf:path>')
  end 
end 