module ApplicationHelper
  include SessionsHelper

  def active_by(_controller_name)
    controller_path==_controller_name ? 'active' : ''
  end

  def word_limit(words, length: 100)
    words.to_s.length > length ? "#{words[0..99]}..." : words.to_s
  end
end
