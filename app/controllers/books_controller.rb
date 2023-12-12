class BooksController < ApplicationController
  

  def create
    @book = Book.new(list_params)
    if @list.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to book_path(@list.id)
    else
      flash.now[:notice] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(list.id)
  end

  def delete
    list = Book.find(params[:id])
    list.destroy
    redirect_to '/lists'


  end


  private
  def book_params
    params.require(:books).permit(:title, :body)
  end
  
  
end
