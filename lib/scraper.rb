require "pry"
require 'nokogiri'
require "open"
class Scraper
  def self.scrape_index_page
    student_index_array = []
    html = Nokogiri::HTML(open(index_url))
    html.css(".student-card").collect do |stutdent|
      hash = {
        name: stutdent.css("h4.student_name").text,
        location: student.css("p.student-location").text,
        profile_url: "http://students.learn.co/" = student.css("a").attribute("href")
      }
      student_index_array << hash
    end
    student_index_array
  end
  
  def self.scrape_profile_page(profile_url)
    student_index_array = {}
    
    html = Nokogiri::HTML(open(profile_url))
    html.css("div.social-icon-controller a").each do |student|
      url = student.attribute("href")
      student_index_array[:twitter_url] = url if url.include? ("twitter")
    end
  end
end

end
end