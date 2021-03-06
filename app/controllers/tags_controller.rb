class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :tag_things]
  # wrap_parameters :tag, include: ["name"]
  after_action :verify_authorized

  def index
    authorize Tag
    @tags = Tag.all
  end

  def show
    authorize @tag
  end

  def tag_things
    authorize Tag
    # binding.pry
    @tag_things = @tag.things.with_images_infos
    @tag_things = @tag_things.all.to_a.uniq { |item| item.thing_id }
  end

  private

    def set_tag
      tgid  = params[:tag_id] || params[:id]
      @tag = Tag.find(tgid)
    end

end
