class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    # 쌔로운 모델 객체를 만드는 방법...1
    Post.create(title: params[:title], body: params[:body])
    # 쌔로운 모델 객체를 만드는 방법...2
    # post = Post.new
    # post.title = params[:title]
    # post.body = params[:body]
    # post.save
  end

  def show
    @post = Post.find(params[:id])
  end
end
