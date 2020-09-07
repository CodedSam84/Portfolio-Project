class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy, :move]
  layout "portfolio"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
  def index
    @portfolio_items = Portfolio.by_position
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def move
    @portfolio_item.insert_at(params[:position].to_i)
    head :ok
  end
  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
        if @portfolio_item.save
          format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
        else
          format.html { render :new }
        end
    end
  end

  def edit 
  end

  def show
  end
  
  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Record was successfully removed.' }
    end
  end

  def update
    respond_to do |format|
        if @portfolio_item.update(portfolio_params)
          format.html { redirect_to portfolios_path, notice: 'portfolio was successfully updated.' }
        else
          format.html { render :edit } 
        end
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:name, :id, :_destroy]
                                     )
  end

  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end
end
