module BandDocumentation
  extend ActiveSupport::Concern
  included do
    include Swagger::Blocks
    swagger_path '/bands/{id}' do
      operation :get do
        key :summary, 'Retrieve a single band'
        key :description, 'Retrieves a single band with all data attributes'
        key :operationId, 'findBandById'
        key :tags, ['band']
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'ID of the band to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        response 200 do
          key :description, 'band response'
          schema do
            key :'$ref', :Band
          end
        end
      end
    end
    swagger_path '/bands' do
      operation :get do
        key :summary, 'Retrieve all bands'
        key :description, 'Retrieves all bands with all data attributes'
        key :bandId, 'findAllBands'
        key :tags, ['band']
        response 200 do
          key :description, 'Band response'
          schema do
            key :'$ref', :Band
          end
        end
      end
    end
    swagger_path '/bands' do
      operation :post do
        key :summary, 'Creates a new Band'
        key :description, 'Creates a new Band with a list of songs'
        key :operationId, 'addBand'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'band'
        ]
        parameter do
          key :name, :band
          key :in, :body
          key :description, 'Band to add to the library'
          key :required, true
          schema do
            key :'$ref', :BandInput
          end
        end
        response 200 do
          key :description, 'Band response'
          schema do
            key :'$ref', :Band
          end
        end
      end
    end
    swagger_path '/bands/{id}' do
      operation :put do
        key :summary, 'Updates a single band'
        key :description, 'Updates an Band with a list of songs'
        key :operationId, 'updateBand'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'band'
        ]
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'Band to update in the library'
          key :required, true
          schema do
            key :'$ref', :BandInput
          end
        end
        response 200 do
          key :description, 'Band response'
          schema do
            key :'$ref', :Band
          end
        end
      end
    end
    swagger_path '/bands/{id}' do
      operation :delete do
        key :summary, 'Deletes a single band'
        key :description, 'Deletes an band with the list of songs'
        key :operationId, 'deleteBand'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'band'
        ]
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'Band to delete in the library'
          key :required, true
        end
        response 200 do
          key :description, 'Band response'
          schema do
            key :'$ref', :Band
          end
        end
      end
    end
  end
end
