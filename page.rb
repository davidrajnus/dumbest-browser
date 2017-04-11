require 'net/http'
require 'nokogiri'
require 'open-uri'


class Page
  def initialize(url)
    @url = url
  end
  
  def fetch!
    @doc = Nokogiri::HTML(open(@url))
  end
  
  def title
    @doc.title
  end
  
  def links
    @links = []
    links_before_filter = @doc.search('a').map{ |link| link['href'] }
    links_before_filter.map! {|link| link.to_s}
    links_before_filter.each do |link|
      if link.start_with?"http://"
        @links << link
      end
    end
    @links
    # Research alert!
    # How do you use Nokogiri to extract all the link URLs on a page?
    #
    # These should only be URLs that look like
    #   <a href="http://somesite.com/page.html">Click here!</a>
    # This would pull out "http://somesite.com/page.html"
  end

  def calculate_char_count
      @paragraphs = @doc.css("div.zn-body__paragraph")
      p @paragraphs.inner_text.length
    end

end