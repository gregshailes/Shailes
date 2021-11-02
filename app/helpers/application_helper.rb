module ApplicationHelper

  def markdown(text)
    renderer.render(text).html_safe
  end

  private

  def renderer
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::XHTML.new(render_options = {}), extensions = {no_intra_emphasis: true})
  end

end
