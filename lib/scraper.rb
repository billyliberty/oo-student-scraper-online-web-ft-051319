require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    student_array = []
    index_page = Nokogiri::HTML(open(index_url))
    index_page.css(".student.card").map do |student|
      hash = {
        name: student.css(".student-name").text,
        location: student.css(".student-location").text,
        profile_url: "http://students.learn.co/" + student.css("a").attribute("href")
      }
      student_array << hash
    end
    student_array
  end

  def self.scrape_profile_page(profile_url)
    student_hash = {}
    html = Nokogiri::HTML (open(profile_url))
    html.css("div.social-icon-controller a").each do |student|
      url = student.attribute ("href")
        student_hash[:twitter_url] = url if url.include?("twitter")
        student_hash[:linkedin_url] = url if url.include?("linkedin")
        student_hash[:github_url] = url if url.include?("github")
        student_hash[:blog_url] = url if student.css("img").attribute("src").text.include?("rss")
        student_hash[:profile_quote] = html.css("div.profile-quote").text
        student_hash[:bio] = html.css("div.bio-content p").text
      end
      student_hash
    end
  end
