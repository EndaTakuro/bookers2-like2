class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.book_comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
      redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.book_comments.find(params[:id])
    @comment.destroy
    redirect_to book_path(@book)
  end

  private

  def comment_params
    params.require(:book_comment).permit(:content)
  end
end
