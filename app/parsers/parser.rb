class Parser
  def parse
    raise NoMethodError
  end

  private

  def agent
    @agent ||= Mechanize.new
  end

  def strip_line_breaks(node)
    node.text.squish
  end
end
