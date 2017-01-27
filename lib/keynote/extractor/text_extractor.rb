require 'rubygems'
require 'nokogiri'

module Keynote 
  module Extractor
    class TextExtractor 
      def self.get_text(content)
        text = []
        text_nodes = search_for_bodies(content) 
        text_nodes.each do |tn|
          content = get_from_bodies(tn)
          text << content unless content.empty?
        end 

        text.uniq
      end 

      def self.search_for_bodies(content)
        doc = Nokogiri::XML(content)
        doc.xpath("//sf:text-body")
      end

      def self.get_from_bodies(body_text)
        body_text.child.content
      end
    end 
  end
end 