# frozen_string_literal: true

class PlaylistsController < ApplicationController
  include PlaylistDocumentation
  before_action :set_playlist, only: %i[show update destroy]

  # GET /playlists
  def index
    if params[:term].present?
      @playlists = Playlist.search(params[:term], limit: 10).results
    else
      @playlists = Playlist.all
    end

    render json: @playlists
  end

  # GET /playlists/1
  def show
    render json: @playlist
  end

  # POST /playlists
  def create
    @playlist = Playlist.new(playlist_params)

    if @playlist.save
      render json: @playlist, status: :created, location: @playlist
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /playlists/1
  def update
    if @playlist.update(playlist_params)
      render json: @playlist
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /playlists/1
  def destroy
    @playlist.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def playlist_params
    params.require(:playlist).permit(:name, :author, :date, song_ids: [])
  end
end
