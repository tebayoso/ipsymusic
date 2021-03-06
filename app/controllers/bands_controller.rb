# frozen_string_literal: true

class BandsController < ApplicationController
  include BandDocumentation
  before_action :set_band, only: %i[show update destroy]

  # GET /bands
  def index
    @bands = Band.includes(:albums, :artists)
    if params[:term].present?
      @bands = @bands.search(params[:term], limit: results_limit).results
    else
      @bands = @bands.limit(results_limit)
    end

    options = {}.tap do |opt|
      opt[:meta] = { total: @bands.count }
    end

    render json: BandSerializer.new(@bands, options).serialized_json
  end

  # GET /bands/1
  def show
    render json: @band
  end

  # POST /bands
  def create
    @band = Band.new(band_params)

    if @band.save
      render json: @band, status: :created, location: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bands/1
  def update
    if @band.update(band_params)
      render json: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bands/1
  def destroy
    @band.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_band
    @band = Band.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def band_params
    params.require(:band).permit(:name, :bio, :start_date, :end_date, artist_bands_attributes: [:artist_id, :joined, :left])
  end
end
