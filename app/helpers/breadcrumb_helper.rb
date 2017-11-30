module BreadcrumbHelper

  def breadcrumbs(*crumbs)
    content_tag(:nav, aria: { label: 'breadcrumb' }, role: 'navigation') do
      content_tag(:ol, class: 'breadcrumb') do
        crumbs.map do |crumb|
          if crumb == crumbs.last
            content_tag(:li, class: %w(breadcrumb-item active), aria: { current: 'page' }) do
              crumb.to_s
            end
          else
            content_tag(:li, class: 'breadcrumb-item') do
              if crumb.kind_of?(Array)
                link_to(crumb.last.to_s, crumb)
              else
                link_to(crumb.to_s, crumb)
              end
            end
          end
        end.reduce(:+)
      end
    end
  end
end
