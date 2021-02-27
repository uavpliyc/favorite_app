class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.create(recipe_id: params[:recipe_id])
    redirect_back(fallback_location: root_path) #一覧なら一覧、詳細なら詳細に瞬時に戻す
  end

  def destory
    @recipe = Recipe.find(params[:recipe_id]) #いいねを削除するレシピを見つける
    @favorite = current_user.favorites.find_by(recipe_id: @recipe.id) #ログイン中ユーザーがいいねしたレシピ見つける
    @favorite.destroy #上の2つによって見つけたいいねを取り消す
    redirect_back(fallback_location: root_path)
  end

end
