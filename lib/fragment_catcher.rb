require "fragment_catcher/version"
require 'nokogiri'
require 'open-uri'

class FragmentCatcher
  attr_accessor :url, :css

  def initialize(url: nil, css: nil)
    @url = url
    @css = css
  end

  def get
    success?
  end

  def fragments
    get_fragments = Array.new
    page.css(css).each do |link|
      get_fragments << link.content
    end
    get_fragments
  end

  def success?
    fragments.any?
  end

  def body
    file
  end

  def code
    file.status.first
  end

  private

    def page
      @page ||= Nokogiri::HTML(file)
    end

    def file
      @file ||= URI.parse(url).read
    end
end
