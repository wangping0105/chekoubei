module ApplicationHelper
  include SessionsHelper

  def active_by(_controller_name)
    controller_name==_controller_name ? 'active' : ''
  end

  def word_limit(words, length: 100)
    words.length > length ? "#{words[0..99]}..." : words
  end
end
