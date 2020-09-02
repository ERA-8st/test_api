class MusicsController < ApplicationController

  require 'rspotify'
RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

def search
  #@musics = Music.all
  if params[:search].present?
  @searchartists = RSpotify::Artist.search(params[:search])
  
  end
end

def show
  @song = RSpotify::Track.find(params[:id])
  @album = @song.album
  @album_image = @album.images[1]
  @song_comment = SongComment.new
  @song_comments = SongComment.where(song_id: @song.id)
end


end
