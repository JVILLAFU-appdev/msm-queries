class ActorsController < ApplicationController

  def index

    @list_of_actors = Actor.all

    render({:template => "actor_template/index.html.erb"})
  end

  def about

    @the_id = params.fetch("id")
    @the_actor = Actor.where({:id => @the_id}).at(0)
  
    @roles = Character.where({ :actor_id => @the_actor.id})
    
    render({:template => "actor_template/about.html.erb"})
  end
end
