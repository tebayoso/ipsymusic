# frozen_string_literal: true

class ApidocsController < ActionController::Base
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Ipsy Music Api'
      key :description, 'A sample API to handle a music library'
      key :termsOfService, ''
      contact do
        key :name, 'Jorge de los Santos'
      end
      license do
        key :name, 'MIT'
      end
    end
    tag do
      key :name, 'album'
      key :description, 'Albums Operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, ''
      end
    end
    tag do
      key :name, 'playlist'
      key :description, 'Playlists Operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, ''
      end
    end
    tag do
      key :name, 'song'
      key :description, 'Songs Operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, ''
      end
    end
    tag do
      key :name, 'band'
      key :description, 'Bands Operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, ''
      end
    end
    tag do
      key :name, 'artist'
      key :description, 'Artists Operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, ''
      end
    end
    key :host, ENV['HOST']
    key :basePath, '/'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
    AlbumsController,
    Album,
    PlaylistsController,
    Playlist,
    ArtistsController,
    Artist,
    BandsController,
    Band,
    SongsController,
    Song,
    self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
