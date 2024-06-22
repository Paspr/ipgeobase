# frozen_string_literal: true

require "test_helper"
require "address"

class TestIpgeobase < Minitest::Test
  def setup
    expected_output_file = File.expand_path("./fixtures/expected_output.xml", __dir__)
    @expected_output = File.read(expected_output_file)
    stub_request(:get, "http://ip-api.com/xml/8.8.8.8")
      .to_return(body: @expected_output, headers: { 'Content-Type' => 'application/xml'})
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_lookup_method
    actual = Ipgeobase.lookup("8.8.8.8")
    parsed = Address.parse(@expected_output)
    assert_equal parsed, actual
  end
end
