module Api::V1
  class LinksController < Api::V1::ApplicationController
    def show
      @link = Link.find_by(id: params[:id])
      @link ? redirect_to(@link.url) : head(:not_found)
    end
  end
end
