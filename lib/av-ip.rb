require 'net/https'
require 'uri'

class AVIP
	def initialize(ip = '127.0.0.1', format = 'json')
		@ip = ip
		@format = format
		@formats = [
			'xml',
			'csv',
			'json'
		]
		@params = [
			'format',
			'ip'
		]
	end

	# Input options in hash form ie {:format => 'json', :ip => '127.0.0.1'}
	def update(param_hash)
		param_hash.each do |key,value|
			if @params.include?(key.to_s)
				if key.to_s == 'format'
					if @formats.include?(value.to_s)
						@format = value
						puts "Format changed to #{value}."
					else
						puts "Format type does not exist."
						puts "#{key} has not changed."
					end
				elsif key.to_s =='ip'
					@ip = value
					puts "Ip changed to #{value}."
				end
			else
				puts "Paramater: #{key} is not a valid option."
				puts "Warning: No change has been made."  
			end
		end
	end

	def search(ip = nil)
		if ip == nil
			p_ip = @ip
		else
			p_ip = ip
		end
		uri = URI("http://freegeoip.net/#{@format}/#{p_ip}")
		Net::HTTP.start(uri.host, uri.port) do |http|
			request = Net::HTTP::Get.new uri
			response = http.request request
			return response.body
		end
	end
end
