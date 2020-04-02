require "pry"
require 'nokogiri'

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
  end
    student_index_array
  end
end

end