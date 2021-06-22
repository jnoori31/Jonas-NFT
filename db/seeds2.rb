require 'nokogiri'
require 'open-uri'

# categories = %w(music art sports collectibles)
html_content = "https://opensea.io/collection/art";
doc = Nokogiri::HTML(open(html_content))

links_html = doc.css('div.Blockreact__Block-sc-18q9hu0-0.dFhPys a')
links = links_html.map { |link| link[:href]}
p links