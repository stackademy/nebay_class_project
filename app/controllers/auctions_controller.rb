class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]


  # GET /auctions
  # GET /auctions.json
  def index
    sort_order= params[:order]
    @auctions = Auction.order(sort_order)
  end

  # GET /auctions/1
  
  # GET /auctions/1.json
  def show
  end

  # GET /auctions/new
  def new
    @auction = Auction.new
  end

  def my_auctions
    @auctions = Auction.where(user:current_user)
    render :index
  end


  # GET /auctions/1/edit
  def edit
    
  end

  # POST /auctions
  # POST /auctions.json
  def create
    raise auction_params.inspect
    @auction = Auction.new(auction_params)
    @auction.user = current_user


    respond_to do |format|
      if @auction.save
        format.html { redirect_to @auction, notice: 'Auction was successfully created.' }
        format.json { render :show, status: :created, location: @auction }
      else
        format.html { render :new }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auctions/1
  # PATCH/PUT /auctions/1.json
  def update
    respond_to do |format|
      if @auction.update(auction_params)
        format.html { redirect_to @auction, notice: 'Auction was successfully updated.' }
        format.json { render :show, status: :ok, location: @auction }
      else
        format.html { render :edit }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auctions/1
  # DELETE /auctions/1.json
  def destroy
    @auction.destroy
    respond_to do |format|
      format.html { redirect_to auctions_url, notice: 'Auction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auction_params
      params.require(:auction).permit(:title, :description, :end_date, :category, :picture)
    end

  def check_user
    unless @auction.user == current_user
      redirect_to auctions_path, notice: "You are not authorized to do this"  
    end

  end
end
