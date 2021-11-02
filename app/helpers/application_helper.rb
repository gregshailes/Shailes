module ApplicationHelper

  def markdown(text)
    renderer.render(text).html_safe
  end

  private

  def renderer
    @renderer ||= Redcarpet::Markdown.new(
      Redcarpet::Render::XHTML.new(render_options = {}),
      extensions = {
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        disable_indented_code_blocks: true
      }
    )
  end

end
