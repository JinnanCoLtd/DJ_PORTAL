class ListingsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :update, :basics, :photographs, :address, :calender, :guarantee, :contact, :bankaccount, :publish]
  before_action :access_deny, only:[:basics, :photographs, :address, :calender, :guarantee, :contact, :bankaccount, :publish]

  def index
    @listings = current_user.listings
  end

  def show
    @listing = Listing.find(params[:id])
    @photographs = @listing.photographs
  end

  def new
    #現在のユーザーのリスティング作成
    @listing = current_user.listings.build
  end

  def create
    #パラメータとともに現在のリスティングを作成
    @listing = current_user.listings.build(listing_params)
      if @listing.save
        redirect_to manage_listing_basics_path(@listing), notice: "リスティングを作成、保存しました。"
      else
        redirect_to new_listing_path, notice: "リスティングの作成に失敗しました。"
      end
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    redirect_to :back, notice: "更新に成功しました。"
  end

  def basics
  end

  def photographs
    @photograph = Photograph.new
  end

  def address

  end

  def calender
  end

  def guarantee
  end

  def contact
  end

  def bankaccount
    @user = @listing.user
    session[:listing_id] = @listing.id
  end

  def publish
  end


  private
  def listing_params
    params.require(:listing).permit(:location, :playing_years, :playing_per_year, :genre_main, :address, :listing_title, :listing_content, :guarantee, :active, :address)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def access_deny
    if !(current_user == @listing.user)
      redirect_to root_path, notice: "他人の編集ページにはアクセスできません"
    end
  end
  
end
