# frozen_string_literal: true

class MicropostsController < ApplicationController
  require 'mechanize'
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.content.include?('https://www.amazon.co.jp')
      scraiping(@micropost.content)
      if @micropost.save
        flash[:success] = 'Book Log created!'
        redirect_to root_url
      else
        @feed_items = current_user.feed.paginate(page: params[:page])
        render 'static_pages/home', status: :unprocessable_entity
      end
    else
      flash[:danger] = 'Invalid url'
      redirect_to root_url, status: :unprocessable_entity
    end
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update(micropost_params)
      flash[:success] = 'Book log updated'
      redirect_to root_url
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = 'Book Log deleted'
    redirect_back_or_to(root_url, status: :see_other)
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :image, :comment)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url, status: :see_other if @micropost.nil?
  end

  def scraiping(url)
    agent = Mechanize.new
    agent.user_agent_alias = 'Windows Chrome'
    page = agent.get(url)
    title_element = page.at('span#productTitle')
    title = title_element.text.strip if title_element
    @micropost.title = title

    # 全ての画像要素を取得
    images = page.search('img')
    # 任意のvalueを持つsrc属性を持つ画像を探す
    image = images.find { |img| img['alt'] == title }
    @micropost.image_url = image['src']
  end
end
