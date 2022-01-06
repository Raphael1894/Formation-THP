# frozen_string_literal: true

namespace :indeed_task do
  desc 'TODO'
  task scrap_job_offers: :environment do
    require 'nokogiri'
    require 'open-uri'
    all_tags = Tag.all
    if all_tags.any?
      all_tags.each_with_index do |one_tag, index|
        keyword = one_tag.name.parameterize.gsub('-', '%20')
        link_to_search = "https://fr.indeed.com/jobs?q=#{keyword}&l="
        page = Nokogiri::HTML(URI.open(link_to_search.to_s))

        search_result = page.xpath('//*[@id="searchCountPages"]').text.gsub(/\D/, '')
        search_result.slice!(0)
        if search_result == nil
          one_tag.update(job_offer: 0)
        else
          one_tag.update(job_offer: search_result)
        end
      end
    end
  end
end
