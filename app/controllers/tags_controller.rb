class TagsController < ApplicationController
  before_action :set_tag, only: [:show]


  def index
    @tags = Tag.all
  end

  def show
  end


  private

    def set_tag
      tgid  = params[:tag_id] || params[:id]
      @tag = Tag.find(tgid)
    end

end
