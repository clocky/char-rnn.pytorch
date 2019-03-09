require 'wombat'

class DailyMail
  include Wombat::Crawler

  base_url "http://www.dailymail.co.uk"
  path "/news/headlines/index.html"

  sidebar do |item|
    item.headlines "css=ul.link-bogr2 li span.pufftext strong", :list
  end
end

headlines = DailyMail.new.crawl

puts headlines["sidebar"].sort