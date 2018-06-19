class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    # 쌔로운 모델 객체를 만드는 방법...1
    # Post.create(title: params[:title], body: params[:body])
    # text 안에 변수를 넣을 때 반드시 **로 해주어야 한다.

    # 쌔로운 모델 객체를 만드는 방법...2
    post = Post.new
    post.title = params[:title]
    post.body = params[:body]
    post.save
    flash[:notice] = "글이 작성 되었습니다."
    redirect_to "/post/#{post.id}"
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:alert] = "글이 삭제 되었습니다."
    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(title: params[:title], body: params[:body])
    flash[:notice] = "글이 수정 되었습니다."
    redirect_to "/post/#{post.id}"
  end
end
