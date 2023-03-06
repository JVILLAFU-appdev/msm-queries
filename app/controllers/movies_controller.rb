class MoviesController < ApplicationController

  def index

    @list_of_movies = Movie.all

    render({:template => "movie_template/index.html.erb"})
  end

  def about

    @the_id = params.fetch("id")
    @the_movie = Movie.where({:id => @the_id}).at(0)
    
    render({:template => "movie_template/about.html.erb"})
  end
end
