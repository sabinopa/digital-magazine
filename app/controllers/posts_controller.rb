class PostsController < ApplicationController 
  before_action :authenticate_user! 

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.date = Time.zone.now
    if @post.save!
      redirect_to root_path, notice: 'Post publicado com sucesso!'
    else 
      render :new, alert: 'Tenta novamente!'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end