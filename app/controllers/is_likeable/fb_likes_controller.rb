module IsLikeable
  class FbLikesController < ApplicationController
    unloadable
    layout false
  
    def show
      @fb_data = FbLike.find(params[:id])
    end
  end
end