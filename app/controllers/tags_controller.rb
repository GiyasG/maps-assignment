class TagsController < ApplicationController
  before_action :set_tag, only: [:show]
  after_action :verify_authorized

  def index
    authorize Tag
    @tags = Tag.all
  end

  def show
    authorize @tag
  end


  private

    def set_tag
      tgid  = params[:tag_id] || params[:id]
      @tag = Tag.find(tgid)
    end

end
