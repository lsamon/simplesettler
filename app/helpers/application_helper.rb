module ApplicationHelper
  def title(text)
    content_for(:title) { text }
  end

  def meta_tag(tag, text)
    content_for :"meta_#{tag}", text
  end

  def yield_meta_tag(tag, default_text='')
    content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
  end

  def language_list
    %w(English Nepali Chinese Japanese)
  end



  def country_name(country_code)
    return "Not set" if country_code.nil?
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end


end
