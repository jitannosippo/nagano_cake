class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genres = Genre.find(params[:id])
  end

  def update
    genres = Genre.find(params[:id])
    genres.update(genre_params)
    redirect_to admin_genres_path
  end


  private

  def genre_params
   params.require(:genre).permit(:name)
  end

end
