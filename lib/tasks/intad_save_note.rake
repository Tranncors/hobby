namespace :add do
  desc 'Save current posts'
  task :new_notes => :environment do
    require 'nokogiri'
    require 'open-uri'  
    require 'json'
    
    url = 'http://www.nokogiri.org/tutorials/installing_nokogiri.html'
    doc = open(url)
    
    work = Nokogiri::HTML(doc)
    
    header_taggs = []

    work.css('article').each do |link|
      h1_tag = link.at_css('h1')
      h1 = h1_tag.text.strip
      h2_tag = link.at_css('h2')
      h2 = h2_tag.text.strip
      h3_tag = link.at_css('h3')
      h3 = h3_tag.text.strip
      link_tag = link.css('div.pull-right a')[0]['href']
      href = link_tag.strip
      header_taggs.push(
        h1: h1,
        h2: h2,
        h3: h3,
        href: href)
      #Note.create(:h1 => h1, :h2 => h2, :h3 => h3)
      #puts h1,h2,h3
      Item.create(h1: h1, h2: h2, h3: h3, href: href)
    end
    puts JSON.pretty_generate(header_taggs)
  end
end