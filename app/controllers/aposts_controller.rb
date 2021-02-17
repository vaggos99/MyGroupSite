class ApostsController < ApplicationController
  before_action :set_apost, only: [:show, :edit, :update, :destroy]

  # GET /aposts
  # GET /aposts.json
  def index
    @categories = Category.all

     @aposts = Apost.all
     cate = params[:cate]
     if !cate.nil?
      @aposts = @aposts.where(:category_id =>cate)
        end
        if !params[:search].blank?
          @aposts=@aposts.where("title LIKE ? OR text LIKE ?","%"+params[:search]+"%","%"+params[:search]+"%")
end
end
  def myposts
  @aposts = Apost.where(:user_id => current_user.id)

  end
  def user_posts
  @aposts = Apost.where(:user_id => params[:user_id])

  end

  # GET /aposts/1
  # GET /aposts/1.json
  def show
  end

  # GET /aposts/new
  def new
    @apost = Apost.new
  end

  # GET /aposts/1/edit
  def edit
  end

  # POST /aposts
  # POST /aposts.json
  def create
    @apost = Apost.new(apost_params)

    respond_to do |format|
      if @apost.save
        format.html { redirect_to @apost, notice: 'Apost was successfully created.' }
        format.json { render :show, status: :created, location: @apost }
      else
        format.html { render :new }
        format.json { render json: @apost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aposts/1
  # PATCH/PUT /aposts/1.json
  def update
    respond_to do |format|
      if @apost.update(apost_params)
        format.html { redirect_to @apost, notice: 'Apost was successfully updated.' }
        format.json { render :show, status: :ok, location: @apost }
      else
        format.html { render :edit }
        format.json { render json: @apost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aposts/1
  # DELETE /aposts/1.json
  def destroy
    @apost.destroy
    respond_to do |format|
      format.html { redirect_to aposts_url, notice: 'Apost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apost
      @apost = Apost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def apost_params
      params.require(:apost).permit(:title, :text, :category_id,:user_id,:search)
    end
end
