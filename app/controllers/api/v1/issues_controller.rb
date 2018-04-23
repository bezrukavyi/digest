module Api::V1
  class IssuesController < Api::V1::ApplicationController
    def index
      @result = Issues::Index.call(params: params)
      respond_to_result serializer: Issues::CollectionSerializer
    end

    def show
      @result = Issues::Find.call(params: params, include: %i[top_items subtitles subtitles_items])
      respond_to_result serializer: Issues::EntitySerializer, include: %i[top_items subtitles_items subtitles]
    end
  end
end
