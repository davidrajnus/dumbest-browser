require 'net/http'
require 'nokogiri'
require 'open-uri'

require_relative 'page'

class Browser
  def run!
    # Run the browser
    # Display a prompt for a user
    puts "url>"
    # Parse their input
    url = gets.chomp
    puts "Fetching..."
    # Display useful results by instantiating
    #   a new Page and calling methods on it.
    page = Page.new(url)
    page.fetch!
    puts "Title: #{page.title}"
    puts "Content length: #{page.calculate_char_count} characters"
    page.links
    
    # Questions:
    #  1. How can a user quit the browser gracefully?
    #  2. How can a user ask for help, i.e., how do they know what commands are available to them?
  end
end

Browser.new.run!