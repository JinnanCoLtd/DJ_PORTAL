class UsersController < ApplicationController
  def show #show.html.erbを表示するアクション
  	@user = User.find(params[:id]) #Userモデルからユーザーを探してきた
  end
end
