class BbsController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @bbs = current_user.bbs.order(created_at: :desc)
  end

  def show
    @bbs = Bb.find(params[:id])
  end

  def new
  	@bbs = Bb.new
  end

  def create
    @bbs = Bb.new(bbs_params.merge(user_id: current_user.id))
  	
  	if @bbs.save
      redirect_to @bbs, notice: "掲示板「#{@bbs.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @bbs = current_user.bbs.find(params[:id])
  end

  def update
    bbs = current_user.bbs.find(params[:id])
    bbs.update!(bbs_params)
    redirect_to bbs_url, notice: "掲示板「#{@bbs.name}」を更新しました。"
  end

  def destroy
    bbs = current_user.bbs.find(params[:id])
    bbs.destroy
    redirect_to bbs_url, notice: "掲示板「#{@bbs.name}」を削除しました。"
  end

  private

  def bbs_params
  	params.require(:bb).permit(:name, :description, :image)
  end

  def set_task
    @task = current_user.bbs.find(params[:id])
  end
end
