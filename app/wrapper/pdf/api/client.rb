module Pdf
	module Api
    	class Client
            BASE_URL = 'http://api.pdflayer.com/api/convert'.freeze
           
            def get_pdf(docname)
                send_request(:get, :access_key => '38dd1779e1d0f2299d3669eb967192aa',
                :document_url => request.original_url, :document_name => docname, :auth_user => 'nrmateo@dlshsi.edu.ph', :auth_pass => 'abc123' )
            end
           
            def send_request(http_method, path_to_resource, params={})
                connection = Faraday.new(url: BASE_URL  , params: params)
                response = connection.public_send(http_method, path_to_resource)
                JSON.parse(response.body)
            end
        end        
    end
end