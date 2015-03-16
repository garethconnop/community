module ApplicationHelper

  def active(path)
    "active" if current_page?(path)
  end

  def markdown(content)
  	@markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
  		hard_wrap: true,
      autolink: true,
      space_after_headers: true,
      underline: true,
      no_intraemphasis: true,
      filter_html: true,
  	})
  	@markdown.render(content)
  end

end