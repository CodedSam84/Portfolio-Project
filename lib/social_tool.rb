module SocialTool
  require 'news-api'

  def self.news_search
    newsapi = News.new(ENV.fetch("apiKey"))   

    all_articles = newsapi.get_everything(q: 'web developers',
                                        sources: 'techcrunch,ars-technica',
                                        language: 'en')
  end
end