class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id) #1つ目のbook_idはカラム２つ目のbookは３行目に定義したbook,:はイコールと同じ
    favorite.save
    #redirect_back fallback_location: root_path
    redirect_back fallback_location: root_path
  end 
  
  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_back fallback_location: root_path
  end
end
