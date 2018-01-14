class LinksController < ApplicationController
  load_resource

  def show
    redirect_to @link.url
  end
end
