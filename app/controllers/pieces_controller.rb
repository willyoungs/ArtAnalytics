class PiecesController < ApplicationController
  before_action :set_piece, only: [:show, :edit, :update, :destroy]

  # GET /pieces
  # GET /pieces.json
  def index
    @pieces = Piece.all
  end

  # GET /pieces/1
  # GET /pieces/1.json
  def show
  end

  # GET /pieces/new
  def new
    @piece = Piece.new
  end
 
  def plot_area_and_price
    @pieces = Piece.all
    #@vals = [{"name" => name, "area" => area ,"price" => price},..]
    @vals = []
    t = 10
    @pieces.each do |p|
      @temp = {"name"=> p.name, "area" => p.area.to_f, "price" => p.price.to_f}
      @vals.push(@temp)
      t = t - 1
      if t == 0
        break
      end
    end
  end
  # GET /pieces/1/edit
  def edit
  end
  def search
   @pieces = Piece.where("artist = ?", params[:q])
   @avg = @pieces.collect(&:price).sum.to_f/@pieces.length if @pieces.length > 0
  end
  def home
    @pieces = Piece.all
    @avg = @pieces.collect(&:price).sum.to_f/@pieces.length if @pieces.length > 0
    # @pieces = Piece.search(params[:search])
  end
  def avg_price_by_artist
    @artist_and_avg = []
    @artists = Piece.artists
    @artists.each do |a|
      @artistPieces = Piece.where("artist = ?", a)
      @avg = @artistPieces.collect(&:price).sum.to_f/@artistPieces.length if @artistPieces.length > 0
      @temp = {"artist" => a, "avg" => @avg}
      @artist_and_avg.push(@temp)
    end
  end
  def price_by_birthdate_deathdate
    @pieces = Piece.all
    @bvals = []
    @birthdates = Piece.birthdates
    @deathdates = Piece.deathdates
    @birthdates.each do |b|
      @birthdatePieces = Piece.where("birthdate = ?", b)
      @avg = @birthdatePieces.collect(&:price).sum.to_f/@birthdatePieces.length if @birthdatePieces.length > 0
      @temp = {"birthdate" => b, "avg" => @avg}
      @bvals.push(@temp)
    end
    @dvals = []
    @deathdates.each do |d|
      @deathdatePieces = Piece.where("deathdate = ?", d)
      @avg = @deathdatePieces.collect(&:price).sum.to_f/@deathdatePieces.length if @deathdatePieces.length > 0
      @temp = {"deathdate" => d, "avg" => @avg}
      @dvals.push(@temp)
    end
    @bvals.delete_if { |h| h["birthdate"] == nil }
    @bvals.sort_by!{|hsh| hsh["birthdate"]}
    @dvals.delete_if { |h| h["deathdate"] == nil }
    @dvals.sort_by!{|hsh| hsh["deathdate"]}
    
  end
  # POST /pieces
  # POST /pieces.json
  def create
    @piece = Piece.new(piece_params)

    respond_to do |format|
      if @piece.save
        format.html { redirect_to @piece, notice: 'Piece was successfully created.' }
        format.json { render :show, status: :created, location: @piece }
      else
        format.html { render :new }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /pieces/1
  # PATCH/PUT /pieces/1.json
  def update
    respond_to do |format|
      if @piece.update(piece_params)
        format.html { redirect_to @piece, notice: 'Piece was successfully updated.' }
        format.json { render :show, status: :ok, location: @piece }
      else
        format.html { render :edit }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pieces/1
  # DELETE /pieces/1.json
  def destroy
    @piece.destroy
    respond_to do |format|
      format.html { redirect_to pieces_url, notice: 'Piece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_piece
      @piece = Piece.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def piece_params
      params.fetch(:piece, {})
    end
end
