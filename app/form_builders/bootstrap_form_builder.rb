class BootstrapFormBuilder < ActionView::Helpers::FormBuilder

  def select(method, choices, options = {}, html_options = {})
    form_group do
      [
        label(method),
        super(method, choices, options, html_options.reverse_merge(class: 'form-control'))
      ].sum
    end
  end

  def text_field(method, options = {})
    form_group do
      label(method) + super(method, options.reverse_merge(class: 'form-control'))
    end
  end

  private

  delegate :content_tag, to: :@template

  def form_group
    content_tag(:div, class: 'form-group') do
      yield
    end
  end
end
