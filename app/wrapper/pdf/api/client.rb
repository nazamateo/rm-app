module Pdf
	module Api
    	class Client
            BASE_URL = 'http://api.pdflayer.com/api/convert'.freeze
           
            def get_pdf
                send_request(:get, 'advice')
            end
           
            def send_request(http_method, path_to_resource, params={})
                connection = Faraday.new(url: BASE_URL  , params: params)
                response = connection.public_send(http_method, path_to_resource)
                JSON.parse(response.body)
            end
        end        
    end
end
