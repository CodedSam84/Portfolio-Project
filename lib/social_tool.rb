module SocialTool
  require 'news-api'

  def self.news_search
    newsapi = News.new(ENV.fetch("apiKey"))   

    all_articles = newsapi.get_everything(q: 'programming',
                                        sources: 'techcrunch,ars-technica',
                                        language: 'en',
                                        sortBy: 'relevancy',
                                        page: 2)
  end
end