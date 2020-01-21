# fetch_movie_urls() => array of string urls
# start from top rated movies page
# movies = select top 5 links from here
fetch_movie_urls.each do |url|
  scrape_movie(url)
end

# iterate over the movies
  # scrape_movie(url) => hash (of movie info)
# visit the movie url
# extract the title, cast(3), storyline, director, year


# convert movie hashes into a yaml file
