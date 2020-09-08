module HomeHelper
   def articles
      require 'rss'
      require 'open-uri'
      url = "https://www.ruby-lang.org/en/feeds/news.rss"
      open(url) do |rss|
         RSS::Parser.parse(rss)
      end 
   end 
end
