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
    key :host, 'localhost:3000'
    key :basePath, '/'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
    AlbumsController,
    Album,
    self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
