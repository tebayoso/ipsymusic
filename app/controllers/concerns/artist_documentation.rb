module ArtistDocumentation
  extend ActiveSupport::Concern
  included do
    include Swagger::Blocks
    swagger_path '/artists/{id}' do
      operation :get do
        key :summary, 'Retrieve a single artist'
        key :description, 'Retrieves a single artist with all data attributes'
        key :operationId, 'findArtistById'
        key :tags, ['artist']
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'ID of the artist to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        response 200 do
          key :description, 'artist response'
          schema do
            key :'$ref', :Artist
          end
        end
      end
    end
    swagger_path '/artists' do
      operation :get do
        key :summary, 'Retrieve all artists'
        key :description, 'Retrieves all artists with all data attributes'
        key :artistId, 'findAllArtists'
        key :tags, ['artist']
        response 200 do
          key :description, 'Artist response'
          schema do
            key :'$ref', :Artist
          end
        end
      end
    end
    swagger_path '/artists' do
      operation :post do
        key :summary, 'Creates a new Artist'
        key :description, 'Creates a new Artist with a list of songs'
        key :operationId, 'addArtist'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'artist'
        ]
        parameter do
          key :name, :artist
          key :in, :body
          key :description, 'Artist to add to the library'
          key :required, true
          schema do
            key :'$ref', :ArtistInput
          end
        end
        response 200 do
          key :description, 'Artist response'
          schema do
            key :'$ref', :Artist
          end
        end
      end
    end
    swagger_path '/artists/{id}' do
      operation :put do
        key :summary, 'Updates a single artist'
        key :description, 'Updates an Artist with a list of songs'
        key :operationId, 'updateArtist'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'artist'
        ]
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'Artist to update in the library'
          key :required, true
          schema do
            key :'$ref', :ArtistInput
          end
        end
        response 200 do
          key :description, 'Artist response'
          schema do
            key :'$ref', :Artist
          end
        end
      end
    end
    swagger_path '/artists/{id}' do
      operation :delete do
        key :summary, 'Deletes a single artist'
        key :description, 'Deletes an artist with the list of songs'
        key :operationId, 'deleteArtist'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'artist'
        ]
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'Artist to delete in the library'
          key :required, true
        end
        response 200 do
          key :description, 'Artist response'
          schema do
            key :'$ref', :Artist
          end
        end
      end
    end
  end
end
