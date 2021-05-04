class SimpleForm::Inputs::DatepickerInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    input_html_options[:type] = 'date'
    super
  end
end