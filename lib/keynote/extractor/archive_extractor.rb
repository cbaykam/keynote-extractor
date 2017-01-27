require 'rubygems'
require 'zip'

module Keynote 
  module Extractor 
    class ArchiveExtractor 
      def self.extract(file)
        archive = Zip::File.open(file) 
      end 

      def self.return_index(file)
        archive = extract(file)

        archive.each do |item|
          if item.name == 'index.apxl'
            return item.get_input_stream.read
          end
        end
      end 
    end 
  end 
end 