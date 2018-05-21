module AlbumDocumentation
  extend ActiveSupport::Concern
  included do
    include Swagger::Blocks
    swagger_path '/albums/{id}' do
      operation :get do
        key :summary, 'Retrieve a single album'
        key :description, 'Retrieves a single album with all data attributes'
        key :operationId, 'findAlbumById'
        key :tags, ['album']
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'ID of the album to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        response 200 do
          key :description, 'album response'
          schema do
            key :'$ref', :Album
          end
        end
      end
    end
    swagger_path '/albums/?term={term}' do
      operation :get do
        key :summary, 'Retrieve all albums'
        key :description, 'Retrieves all albums with all data attributes'
        key :albumId, 'findAllalbums'
        key :tags, ['album']
        parameter do
          key :name, :term
          key :in, :path
          key :description, 'Search Term'
          key :required, false
          key :type, :string
        end
        response 200 do
          key :description, 'album response'
          schema do
            key :'$ref', :Album
          end
        end
      end
    end
    swagger_path '/albums' do
      operation :post do
        key :summary, 'Creates a new Album'
        key :description, 'Creates a new Album with a list of songs'
        key :operationId, 'addAlbum'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'album'
        ]
        parameter do
          key :name, :album
          key :in, :body
          key :description, 'Album to add to the library'
          key :required, true
          schema do
            key :'$ref', :AlbumInput
          end
        end
        response 200 do
          key :description, 'Album response'
          schema do
            key :'$ref', :Album
          end
        end
      end
    end
    swagger_path '/albums/{id}' do
      operation :put do
        key :summary, 'Updates a single album'
        key :description, 'Updates an Album with a list of songs'
        key :operationId, 'updateAlbum'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'album'
        ]
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'Album to update in the library'
          key :required, true
          schema do
            key :'$ref', :AlbumInput
          end
        end
        response 200 do
          key :description, 'Album response'
          schema do
            key :'$ref', :Album
          end
        end
      end
    end
    swagger_path '/albums/{id}' do
      operation :delete do
        key :summary, 'Deletes a single album'
        key :description, 'Deletes an album with the list of songs'
        key :operationId, 'deleteAlbum'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'album'
        ]
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'Album to delete in the library'
          key :required, true
        end
        response 200 do
          key :description, 'Album response'
          schema do
            key :'$ref', :Album
          end
        end
      end
    end
  end
end
