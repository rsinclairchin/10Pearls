require 'net/http'

# the api key provided didn't return any results
# api_key = "kfgpmgvfgacx98de9q3xazww"

# used the test key provided by wmata
api_key = '44e1abafef1145eebc44b74164f4125d'

uri = URI('https://api.wmata.com/StationPrediction.svc/json/GetPrediction/K04')

uri.query = URI.encode_www_form({
  # I'm not 100% sure this query is working
  "Line": "OR"
})

request = Net::HTTP::Get.new(uri.request_uri)
request['api_key'] = api_key
request.body = "{body}"

response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == "https") do |http|
  http.request(request)
end

puts response.body


### SOME IDEAS ###

# filter the response for "Line":"OR"
# puts response.body["Trains"]["Line"]["OR"]


# make a method that returns the first train
# that has "Line" with the value "OR"

# def getOrangeLine(response)
#   response.each do |train|
#     if train["Line"] == "OR"
#       puts train
#     end
#   end
# end

# getOrangeLine(response)

# neither approach works yet
# they might with a little more tweaking
# or there might be a better way