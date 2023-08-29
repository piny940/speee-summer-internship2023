require 'net/http'

module Miniul
  CONVERSIONS_ENDPOINT = "https://miniul-api.herokuapp.com/affiliate/v2/conversions"
  def self.create_assessment(params)
    uri = URI.parse(CONVERSIONS_ENDPOINT)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme = "https"
    headers = { "Content-Type" => "application/json" }
    data = {
      **params,
      url_params: 'beteran-sumai'
    }
    http.post(uri.path, params.to_json, headers)
  end
end
