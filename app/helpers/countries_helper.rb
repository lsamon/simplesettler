module CountriesHelper
  def country(country_code)
    Worldly::Country[country_code]
  end
end
