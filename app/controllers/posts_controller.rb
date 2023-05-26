  class PostsController < ApplicationController
    def new
      @post = Post.new
      @post.content = params[:content] if params[:content].present?
    end
  
    def create
      if params[:back]
        @post = Post.new(content: params[:content])
        render :new
      else
        @post = Post.new(post_params)
        if @post.save
          redirect_to posts_path, notice: "Post created!"
        else
          render :new
        end
      end
    end
  

  def show
    @post = Post.find(params[:id])
    if @post.nil?
    end
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

  if @post.update(post_params)
    redirect_to @post
  else
    render 'edit'
  end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy

  redirect_to posts_path
end

def confirm
  if params[:post].present?
  @post = Post.new(post_params)
  if @post.invalid?
    render :confirm
  end
else
  @post = Post.new
  render :new
end
end

private

def post_params
    params.require(:post).permit(:content)
end
end
