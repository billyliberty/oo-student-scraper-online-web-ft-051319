require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))
    students = []
    index_page.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        student_profile_link = "#{student.attr('href')}"
        def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))
    students = []
    index_page.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        student_profile_link = "#{student.attr('href')}"
        student_location = student.css('.student-location').text
        student_name = student.css('.student-name').text
        students << {name: student_name, location: student_location, profile_url: student_profile_link}
      end
    end
    students
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
