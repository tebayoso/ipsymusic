# frozen_string_literal: true

module AlbumModelDocumentation
  include Swagger::Blocks

  swagger_schema :Album do
    key :required, %i[id name]
    property :id do
      key :type, :integer
      key :format, :int64
    end
    property :name do
      key :type, :string
    end
    property :author_id do
      key :type, :integer
      key :format, :int64
    end
    property :author_type do
      key :type, :string
    end
    property :date do
      key :type, :datetime
    end
  end
end
