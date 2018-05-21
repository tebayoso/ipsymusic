module SongDocumentation
  extend ActiveSupport::Concern
  included do
    include Swagger::Blocks
    swagger_path '/songs/{id}' do
      operation :get do
        key :summary, 'Retrieve a single song'
        key :description, 'Retrieves a single song with all data attributes'
        key :operationId, 'findSongById'
        key :tags, ['song']
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'ID of the song to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        response 200 do
          key :description, 'song response'
          schema do
            key :'$ref', :Song
          end
        end
      end
    end
    swagger_path '/songs' do
      operation :get do
        key :summary, 'Retrieve all songs'
        key :description, 'Retrieves all songs with all data attributes'
        key :songId, 'findAllSongs'
        key :tags, ['song']
        response 200 do
          key :description, 'Song response'
          schema do
            key :'$ref', :Song
          end
        end
      end
    end
    swagger_path '/songs' do
      operation :post do
        key :summary, 'Creates a new Song'
        key :description, 'Creates a new Song with a list of songs'
        key :operationId, 'addSong'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'song'
        ]
        parameter do
          key :name, :song
          key :in, :body
          key :description, 'Song to add to the library'
          key :required, true
          schema do
            key :'$ref', :SongInput
          end
        end
        response 200 do
          key :description, 'Song response'
          schema do
            key :'$ref', :Song
          end
        end
      end
    end
    swagger_path '/songs/{id}' do
      operation :put do
        key :summary, 'Updates a single song'
        key :description, 'Updates an Song with a list of songs'
        key :operationId, 'updateSong'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'song'
        ]
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'Song to update in the library'
          key :required, true
          schema do
            key :'$ref', :SongInput
          end
        end
        response 200 do
          key :description, 'Song response'
          schema do
            key :'$ref', :Song
          end
        end
      end
    end
    swagger_path '/songs/{id}' do
      operation :delete do
        key :summary, 'Deletes a single song'
        key :description, 'Deletes an song with the list of songs'
        key :operationId, 'deleteSong'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'song'
        ]
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'Song to delete in the library'
          key :required, true
        end
        response 200 do
          key :description, 'Song response'
          schema do
            key :'$ref', :Song
          end
        end
      end
    end
  end
end
