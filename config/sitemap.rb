# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://kappa2haiku.herokuapp.com/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  SitemapGenerator::Sitemap.create do
    haiku_sets = HaikuSet.all
    haiku_sets.each do |haiku_set|
      add "haiku/#{haiku_set.token}", :lastmod => haiku_set.updated_at
    end
    words = Word.all
    words.each do |word|
      add word_path(word), :lastmod => word.updated_at
    end
  end

end
