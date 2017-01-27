require "keynote/extractor/version"
require "keynote/extractor/archive_extractor"
require "keynote/extractor/text_extractor"

module Keynote
  module Extractor
    class Parse 
      def self.text(file)
        content = ArchiveExtractor.return_index(file)
        TextExtractor.get_text(content) 
      end   
    end 
  end
end
