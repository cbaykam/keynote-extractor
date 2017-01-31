require 'rubygems'
require 'nokogiri'

module Keynote 
  module Extractor
    class TextExtractor 
      def self.get_text(content)
        text = []
        if content.kind_of?(Array)
          content.each do |c|
            extracted = extract_iwa(c)
            extracted.each do |word|
              text << word
            end
          end 
        else 
          text_nodes = search_for_bodies(content) 
          text_nodes.each do |tn|
            content = get_from_bodies(tn)
            text << content unless content.empty?
          end
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

      def self.extract_iwa(file) 
        res = []
        words = file.encode!('UTF-8', 'UTF-8', :invalid => :replace)
          .gsub(/[^0-9a-z ]/i, '').split(" ")
        words.each do |w|
          res << w unless w.length > 20 or w.include? "Transition" or w.length <= 2
        end

        res
      end 
    end 
  end
end 