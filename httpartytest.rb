require 'rubygems'
require 'httparty'

class Fetcher
    include HTTParty

    base_uri 'https://jsonplaceholder.typicode.com'

    def posts
        self.class.get('/posts')
    end
end

postfetcher = Fetcher.new
puts postfetcher.posts.count
