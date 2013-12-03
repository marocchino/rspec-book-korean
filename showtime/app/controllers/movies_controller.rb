#---
# Excerpted from "The RSpec Book",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/achbd for more book information.
#---
class MoviesController < ApplicationController
  def index
    @genres = Genre.all
    @genre = params[:genre_id] && Genre.find(params[:genre_id])
    @movies = @genre.try(:movies) || []
  end

  def new
    @movie = Movie.new
    @genres = Genre.all
  end

  def create
    Movie.create!(movie_params)
    redirect_to movies_path
  end

  private
  def movie_params
    params[:movie].permit(:title, :release_year, genre_ids: [])
  end
end
