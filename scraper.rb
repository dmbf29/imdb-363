require 'nokogiri'
require 'open-uri'

def fetch_movie_urls
  url = "https://www.imdb.com/chart/top"
  html = open(url, 'Accept-Language' => 'en').read
  objects = Nokogiri::HTML(html)
  # search through the nokogiri objects for urls (first 5)
  objects.search('.titleColumn a').first(5).map do |element|
    "https://www.imdb.com" + element.attributes['href'].value
  end
end

def scrape_movie(url)
  html_content = open(url, 'Accept-Language' => 'en').read
  doc = Nokogiri::HTML(html_content)
  # html = open the url
  # objects = give to nokogir
  movie_info = {}
  # search the objects for our 5
    # put each inside the hash
    # movie_info[key] = .search
  movie_info[:cast] = doc.search('.credit_summary_item')[2].search('a').first(3).map { |e| e.text.strip }
  movie_info[:year] = doc.search('#titleYear a').text.to_i
  movie_info[:title] = doc.search('.title_wrapper h1').text.strip.split('(').first.strip[0..-2]
  movie_info[:director] = doc.search('.credit_summary_item a').first.text.strip
  movie_info[:storyline] = doc.search('.summary_text').text.strip
  # return a hash
  movie_info
end
