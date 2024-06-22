class Address
  include HappyMapper

  tag "query"
  element :status, String
  element :country, String
  element :countryCode, String
  element :region, String
  element :regionName, String
  element :city, String
  element :zip, Integer
  element :lat, Float
  element :lon, Float
  element :timezone, String
  element :isp, String
  element :org, String
  element :as, String
  element :query, String

  # rubocop:disable Metrics/AbcSize
  def ==(other)
    self.class == other.class &&
      status == other.status &&
      country == other.country &&
      countryCode == other.countryCode &&
      city == other.city &&
      lat == other.lat &&
      lon == other.lon
  end
  # rubocop:enable Metrics/AbcSize
end
