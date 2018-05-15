module Api
  module V1
    class UrlResource < JSONAPI::Resource
      attributes :url, :tags
    end
  end
end
