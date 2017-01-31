require 'rubygems'
require 'zip'
require 'snappy'

module Keynote 
  module Extractor 
    class ArchiveExtractor 
      def self.extract(file)
        archive = Zip::File.open(file) 
      end 

      def self.return_files(file)
        archive = extract(file)

        iwa_files = []
        archive.each do |item|
          if item.name == 'index.apxl'
            return item.get_input_stream.read
          end
          iwa_files << item.get_input_stream.read if item.name.split('.').last == 'iwa'
        end
        
        iwa_files
      end
    end 
  end 
end 