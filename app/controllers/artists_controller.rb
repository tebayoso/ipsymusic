# frozen_string_literal: true

class ArtistsController < ApplicationController
  include ArtistDocumentation
  before_action :set_artist, only: %i[show update destroy]

  # GET /artists
  def index
    @artists = Artist.includes(:bands, :songs, :albums)
    if params[:term].present?
      @artists = @artists.search(params[:term], limit: results_limit).results
    else
      @artists = @artists.limit(results_limit)
    end

    options = {}.tap do |opt|
      opt[:meta] = { total: @artists.count }
    end

    render json: ArtistSerializer.new(@artists, options).serialized_json
  end

  # GET /artists/1
  def show
    render json: @artist
  end

  # POST /artists
  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      render json: @artist, status: :created, location: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artists/1
  def update
    if @artist.update(artist_params)
      render json: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artists/1
  def destroy
    @artist.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_artist
    @artist = Artist.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def artist_params
    params.require(:artist).permit(:name, :bio, :birthdate, :alter_name)
  end
end
