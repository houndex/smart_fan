class ArtistsController < ApplicationController

  before_action :load_artist, 
    only: [:show, :edit, :update, :destroy]

  #artists/
  def index
  	@artists = Artist.all
  	#puts "#{@artists.inspect}"
  end

  #artists/123
  def show
  end

  #artists/new
  def new
  	@artist = Artist.new
  end

  #artists/
  def create
  	params_filtered = params.require(:artist).permit(:name, :email, :password)
  	#params_filtered = {name: "michel", email:"michel@gmai.com", password:"2131312"}
  	@artist = Artist.new(params_filtered)
  	if @artist.save
  		redirect_to artists_path
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
    params_filtered = params
      .require(:artist).permit(:name, :email)
    if @artist.update(params_filtered)
      redirect_to artists_path
    else
      render 'edit'
    end
  end

  #delete /artist/1
  def destroy
    @artist.destroy
    redirect_to artists_path, 
      notice: 'Fan eliminado'
  end

  def load_artist
    begin
      @artist = Artist.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to artists_path, 
        notice: 'El fan no existe en el sistema'
    end
  end

  def login
    @artist = Artist.new
  end

  def do_login
    params_filtered = params.require(:artist).permit(:email, :password)
    @artist = Artist.new(params_filtered)
    artist_fetch = @artist.login
    if artist_fetch
      session[:artist_id] = artist_fetch.id
      redirect_to products_path, notice: 'Bienvenido a la tiendita'
    else
      flash.now[:error] = 'Error al autenticarse'
      render 'login'
    end
  end

  def logout
    session[:artist_id] = nil
    redirect_to login_artists_path, notice: 'Vuelve pronto :('
  end

end






