require 'nokogiri'
require 'open-uri'

module FragmentCatcher
  class Client
    attr_accessor :url, :css

    def initialize(url: nil, css: nil)
      @url = url
      @css = css
    end

    def get
      if success?
        true
      else
        false
      end
    end

    def fragments
      get_fragments = Array.new
      page.css(css).each do |link|
        get_fragments << link.content
      end
      get_fragments
    end

    def success?
      unless fragments.empty?
        true
      else
        false
      end
    end

    def body
      page.at('body').inner_html
    end

    def code
      file.status.first
    end

    private

      def page
        @page ||= Nokogiri::HTML(file)
      end

      def file
        @file ||= open(url)
      end
  end
end
