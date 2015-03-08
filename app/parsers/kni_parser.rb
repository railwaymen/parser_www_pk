class KNIParser < Parser

  BASE_URL = 'http://kni.pk.edu.pl/?cat=3'.freeze

  def parse
    page = agent.get(BASE_URL).parser
    news_nodes = page.css('article.post')
    news_nodes.map do |news_node|
      {
        title:      get_title(news_node),
        origin_url: news_node.at_css('h2 > a')['href'],
        posted_at:  get_date(news_node),
        content:    get_content(news_node)
      }
    end
  end

  private

  def get_title(news_node)
    title = news_node.at_css('h2')
    strip_line_breaks(title)
  end

  def get_date(news_node)
    datetime = news_node.at_css('time')['datatime']
    DateTime.strptime(datetime, '%Y-%m-%d')
  end

  def get_content(news_node)
    content = news_node.at_css('section.post-content')
    strip_line_breaks(content)
  end
end
