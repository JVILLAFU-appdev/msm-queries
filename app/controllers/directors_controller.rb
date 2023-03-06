class DirectorsController < ApplicationController

  def index

    @list_of_directors = Director.all

    render({:template => "director_template/index.html.erb"})
  end

  def wisest

    eldest_row = Director.where.not({:dob => nil }).order({:dob => :asc}).at(0)
    @eldest_name = eldest_row.name
    @eldest_dob = eldest_row.dob

    render({:template => "director_template/eldest.html.erb"})
  end

  def youngest

    youngest_row = Director.where.not({:dob => nil }).order({:dob => :desc}).at(0)
    @youngest_name = youngest_row.name
    @youngest_dob = youngest_row.dob

    render({:template => "director_template/youngest.html.erb"})
  end

  def about

    @the_id = params.fetch("id")
    @the_director = Director.where({:id => @the_id}).at(0)
  
    @filmography = Movie.where({ :director_id => @the_director.id})

    render({:template => "director_template/about.html.erb"})
  end
end
