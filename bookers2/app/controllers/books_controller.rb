class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully created'
    else
      @books = Book.all
      @user = current_user
      render :index
      
    end
  end

  def show
    @book = Book.new
    @booksh = Book.find(params[:id])
    @user = @booksh.user
    @book_comment = BookComment.new
  end
  
  def edit
    @book = Book.find(params[:id])
      unless @book.user == current_user
      redirect_to books_path
      end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'Book was successfully updated'
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to books_path, notice: 'Book was successfully destroyed'
    else
      render :index
      
    end
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :id)
  end
  
end
