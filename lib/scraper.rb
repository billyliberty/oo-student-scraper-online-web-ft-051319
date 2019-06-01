require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    student_array = []
    html = Nokogiri::HTML(open(index_url))
    html.css("student.card").map do |student|
      hash = {
        name:
        location:
        profile_url:
      }
      student_array << hash
    end
    students_array
  end

  end

  def self.scrape_profile_page(profile_url)


  end

end
