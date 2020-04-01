require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper
  def self.scrape_index_page(index_url)
    students = []
    html = open(index_url)
    index = Nokogiri::HTML(html)
    index.css("div.roster-cards-container").each do |card|
      card.css(".student-card").each do |student|
        scraped_students = {}
        scraped_students[:name] = student.css("h4.student-name").text
        scraped_students[:location] = student.css("p.student-location").text
        profile_path = student.css("a").attribute("href").value
        #scraped_students[:profile_url] = '"h3.view-profile-div'.value
        students << scraped_students
      end
    end
    students
  end
end