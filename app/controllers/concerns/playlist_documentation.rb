module PlaylistDocumentation
  extend ActiveSupport::Concern
  included do
    include Swagger::Blocks
    swagger_path '/playlists/{id}' do
      operation :get do
        key :summary, 'Retrieve a single playlist'
        key :description, 'Retrieves a single playlist with all data attributes'
        key :operationId, 'findPlaylistById'
        key :tags, ['playlist']
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'ID of the playlist to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        response 200 do
          key :description, 'playlist response'
          schema do
            key :'$ref', :Playlist
          end
        end
      end
    end
    swagger_path '/playlists/?term={term}' do
      operation :get do
        key :summary, 'Retrieve all playlists'
        key :description, 'Retrieves all playlists with all data attributes'
        key :playlistId, 'findAllPlaylists'
        key :tags, ['playlist']
        parameter do
          key :name, :term
          key :in, :path
          key :description, 'Search Term'
          key :required, false
          key :type, :string
        end
        response 200 do
          key :description, 'Playlist response'
          schema do
            key :'$ref', :Playlist
          end
        end
      end
    end
    swagger_path '/playlistss' do
      operation :post do
        key :summary, 'Creates a new Playlist'
        key :description, 'Creates a new Playlist with a list of songs'
        key :operationId, 'addPlaylist'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'playlist'
        ]
        parameter do
          key :name, :playlist
          key :in, :body
          key :description, 'Playlist to add to the library'
          key :required, true
          schema do
            key :'$ref', :PlaylistInput
          end
        end
        response 200 do
          key :description, 'Playlist response'
          schema do
            key :'$ref', :Playlist
          end
        end
      end
    end
    swagger_path '/playlists/{id}' do
      operation :put do
        key :summary, 'Updates a single playlist'
        key :description, 'Updates an Playlist with a list of songs'
        key :operationId, 'updatePlaylist'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'playlist'
        ]
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'Playlist to update in the library'
          key :required, true
          schema do
            key :'$ref', :PlaylistInput
          end
        end
        response 200 do
          key :description, 'Playlist response'
          schema do
            key :'$ref', :Playlist
          end
        end
      end
    end
    swagger_path '/playlists/{id}' do
      operation :delete do
        key :summary, 'Deletes a single playlist'
        key :description, 'Deletes an playlist with the list of songs'
        key :operationId, 'deletePlaylist'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'playlist'
        ]
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'Playlist to delete in the library'
          key :required, true
        end
        response 200 do
          key :description, 'Playlist response'
          schema do
            key :'$ref', :Playlist
          end
        end
      end
    end
  end
end
