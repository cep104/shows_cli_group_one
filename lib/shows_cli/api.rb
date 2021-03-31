class API
    # http://api.tvmaze.com/singlesearch/shows?q=girls
    def get_data(input)
        request = RestClient.get("http://api.tvmaze.com/search/shows?q=#{input}")
        shows = JSON.parse(request)
        shows.each do |show|
           Show.new(show["show"])
            
            # Show.new(show)
        end
        # binding.pry
        
    end
end