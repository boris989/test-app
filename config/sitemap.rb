# frozen_string_literal: true

SitemapGenerator::Sitemap.default_host = Rails.application.config.host
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.compress = false
SitemapGenerator::Sitemap.create do
  add '/contacts'
  add '/documents'
  add '/1-kvartiry'
  add '/2-kvartiry'
  add '/3-kvartiry'
  Apartment.not_removed.each do |item|
    add "kvartira/#{item.slug}"
  end
end
