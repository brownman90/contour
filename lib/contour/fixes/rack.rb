# Overwriting methods from Rack
module Rack
  class Request
    def scheme
      # Rails.logger.debug "Contour::Fixes => Rack::Request::scheme"
      if @env['HTTPS'] == 'on'
        'https'
      elsif @env['HTTP_X_FORWARDED_SSL'] == 'on'
        'https'
      elsif @env['HTTP_X_FORWARDED_PROTO']
        @env['HTTP_X_FORWARDED_PROTO'].split(',')[0]
      else
        @env["rack.url_scheme"]
      end
    end

    def ssl?
      scheme == 'https'
    end

    def host_with_port
      if forwarded = @env["HTTP_X_FORWARDED_HOST"]
        Rails.logger.info "\n\nContour::Fixes => Rack::Request::host_with_port"
        Rails.logger.info "@env[HTTP_X_FORWARDED_HOST]: #{@env["HTTP_X_FORWARDED_HOST"]} USING => #{forwarded.split(/,\s?/).first}\n\n"
        # forwarded.split(/,\s?/).last
        # changed forwarded to first since we don't want the internal IP.
        forwarded.split(/,\s?/).first
      else
        @env['HTTP_HOST'] || "#{@env['SERVER_NAME'] || @env['SERVER_ADDR']}:#{@env['SERVER_PORT']}"
      end
    end

    def port
      if port = host_with_port.split(/:/)[1]
        port.to_i
      elsif port = @env['HTTP_X_FORWARDED_PORT']
        port.to_i
      elsif ssl?
        443
      elsif @env.has_key?("HTTP_X_FORWARDED_HOST")
        80
      else
        @env["SERVER_PORT"].to_i
      end
    end
  end
end