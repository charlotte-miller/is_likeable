require 'net/https'
require 'builder'
require 'cgi'

class YoutubeApi
  class << self
    
    def extract_youtube_id(youtube_url)
      unless youtube_url.nil?    

        #If the user entered the video page url
        query_string = youtube_url.split( '?', 2)[1]
        if query_string
          params = CGI.parse(query_string)
          if params.has_key?("v")
            return params["v"][0]
          end
        end
      end
    end
  
    def swf_link(youtube_id, options={})
      params = options.each do |k, v|
        options[k] = 1 if v.class == TrueClass
        options[k] = 0 if v.class == FalseClass
      end.to_param
      "http://www.youtube.com/v/#{youtube_id}?#{params}"
    end
    
  end
end