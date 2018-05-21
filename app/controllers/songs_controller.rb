# frozen_string_literal: true

class SongsController < ApplicationController
  include SongDocumentation
  before_action :set_song, only: %i[show update destroy]

  # GET /songs
  def index
    if params[:term].present?
      @songs = Song.search(params[:term], limit: 10).results
    else
      @songs = Song.all
    end

    render json: @songs
  end

  # GET /songs/1
  def show
    render json: @song
  end

  # POST /songs
  def create
    @song = Song.new(song_params)

    if @song.save
      render json: @song, status: :created, location: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /songs/1
  def update
    if @song.update(song_params)
      render json: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /songs/1
  def destroy
    @song.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song = Song.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def song_params
    params.require(:song).permit(:name, :author_id, :author_type, :duration, :date)
  end
end
