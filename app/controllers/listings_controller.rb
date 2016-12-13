class ListingsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_listing, only: [:update, :basics, :photographs, :calender, :guarantee, :contact, :bankaccount, :publish]


  def index
  end

  def show
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

  def calender
  end

  def guarantee
  end

  def contact
  end

  def bankaccount
  end

  def publish
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  private
  def listing_params
    params.require(:listing).permit(:location, :playing_years, :playing_per_year, :genre_main, :listing_content, :guarantee, :active)
  end
  
end
