module ApplicationHelper

  def markdown(text)
   renderer.markdown(text).to_html.html_safe
  end

  private

  def renderer
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::XHTML.new(render_options = {}), extensions = {:no_intra_emphasis})
  end

end
