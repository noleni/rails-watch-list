require "json"
require "open-uri"

url = "http://tmdb.lewagon.com/movie/top_rated"
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)

user['results'].each do |result|
  Movie.create(title: result['title'], overview: result['overview'], rating: result['vote_average'], poster_url: "https://image.tmdb.org/t/p/w500#{result['poster_path']}")
end
