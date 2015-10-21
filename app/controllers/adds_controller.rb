class AddsController < ApplicationController
  before_action :set_add, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  skip_authorize_resource :only => [:index, :new]

  # GET /adds
  # GET /adds.json
  def index
    @adds = Add.friendly.paginate(:page => params[:page], :per_page => 3)
    # Find only the adds marked as active
    # @adds = Add.friendly.where(active: true)  
  end

  # GET /adds/1
  # GET /adds/1.json
  def show

  end

  # GET /adds/new
  def new
    if current_user
      @add = Add.new
    else
      redirect_to root_path, :notice => "You must #{view_context.link_to 'register', new_user_registration_path} or #{view_context.link_to 'log in', new_user_session_path} to post new adds.", flash: { html_safe: true }
    end  
  end

  # GET /adds/1/edit
  def edit
    
  end

  # POST /adds
  # POST /adds.json
  def create
    @add = Add.new(add_params)
    @add.user = current_user

    respond_to do |format|
      if @add.save
        format.html { redirect_to @add, notice: 'Add was successfully created.' }
        format.json { render :show, status: :created, location: @add }
      else
        format.html { render :new }
        format.json { render json: @add.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adds/1
  # PATCH/PUT /adds/1.json
  def update
    respond_to do |format|
      if @add.update(add_params)
        format.html { redirect_to @add, notice: 'Add was successfully updated.' }
        format.json { render :show, status: :ok, location: @add }
      else
        format.html { render :edit }
        format.json { render json: @add.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adds/1
  # DELETE /adds/1.json
  def destroy
    @add.destroy
    respond_to do |format|
      format.html { redirect_to adds_url, notice: 'Add was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add
      @add = Add.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def add_params
      params.require(:add).permit(:title, :body, :active)
    end
end
