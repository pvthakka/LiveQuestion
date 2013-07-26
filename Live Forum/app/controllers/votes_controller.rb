class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create

  end

  def show
    @votes = Vote.all(:conditions => {:post_id => params[:post_id]})
  end
end
