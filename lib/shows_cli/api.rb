class API
    # http://api.tvmaze.com/singlesearch/shows?q=girls
    def get_data(input)
        request = RestClient.get("http://api.tvmaze.com/singlesearch/shows?q=#{input}")
        shows = JSON.parse(request)
        binding.pry
    end
end