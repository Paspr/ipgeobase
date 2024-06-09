# frozen_string_literal: true

require "test_helper"

class TestIpgeobase < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_lookup_method
    expected_output = '
    <?xml version="1.0" encoding="UTF-8"?>
<query>
  <status>success</status>
  <country>United States</country>
  <countryCode>US</countryCode>
  <region>VA</region>
  <regionName>Virginia</regionName>
  <city>Ashburn</city>
  <zip>20149</zip>
  <lat>39.03</lat>
  <lon>-77.5</lon>
  <timezone>America/New_York</timezone>
  <isp>Google LLC</isp>
  <org>Google Public DNS</org>
  <as>AS15169 Google LLC</as>
  <query>8.8.8.8</query>'
    stub = stub_request(:get, "http://ip-api.com/xml/8.8.8.8")
           .to_return(body: expected_output)
    Ipgeobase.lookup("8.8.8.8")
    assert_requested stub
  end
end
