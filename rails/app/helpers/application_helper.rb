module ApplicationHelper
  def btn(text, path, type = '', options={})
    css = (options.delete(:class) || options.delete('class')).to_s
    link_to text, path, {class: 'btn ' + type + ' ' + css}.merge(options)
  end

  %w(primary info success warning danger inverse).each do |type|
    define_method 'btn_' + type do |text, path, options = {}|
      btn text, path, 'btn-' + type, options
    end
  end
end
