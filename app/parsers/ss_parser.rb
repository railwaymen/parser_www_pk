class SSParser < Parser
  BASE_URL = 'http://samorzad.pk.edu.pl'.freeze

  MONTH_NUMBERS = {
    'styczeń'     => 1,
    'luty'        => 2,
    'marzec'      => 3,
    'kwiecień'    => 4,
    'maj'         => 5,
    'czerwiec'    => 6,
    'lipiec'      => 7,
    'sierpień'    => 8,
    'wrzesień'    => 9,
    'październik' => 10,
    'listopad'    => 11,
    'grudzień'    => 12
  }.freeze


  def parse
    page = agent.get(BASE_URL).parser
    news_nodes = page.css('.items-row')
    news_nodes.map do |news_node|
      {
        title:      get_title(news_node),
        origin_url: get_full_url(news_node),
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

  def get_full_url(news_node)
    link     = news_node.at_css('a')
    BASE_URL + link['href']
  end

  def get_date(news_node)
    date_node = news_node.at_css('dd')
    date_text = strip_line_breaks(date_node).sub('Utworzono: ', '')
    day, month, year = date_text.split
    DateTime.new(year.to_i, MONTH_NUMBERS[month], day.to_i)
  end

  def get_content(news_node)
    content = news_node.at_css('p')
    strip_line_breaks(content)
  end
end
