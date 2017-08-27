class BlogsController < ApplicationController
  def index
    @blogs = Blog.page(params[:page]).per(3)
    #@blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
  end
  
  def destroy
  end  
  
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blog_path(@blog.id)
    else
      render("products/new") # アクションやメソッドを通らないリダイレクト 
    end
  end
  
  def update
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title,:price,:amount,:description)
  end
end
