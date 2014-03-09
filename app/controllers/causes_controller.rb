class CausesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index, :home] 

  # GET /causes
  # GET /causes.json
  def index
    @causes = Cause.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @causes }
    end
  end

  # GET /causes/1
  # GET /causes/1.json
  def show
    @cause = Cause.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cause }
    end
  end

  # GET /causes/new
  # GET /causes/new.json
  def new
    @cause = Cause.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cause }
    end
  end

  # GET /causes/1/edit
  def edit
    @cause = Cause.find(params[:id])
  end

  # POST /causes
  # POST /causes.json
  def create
    logger.debug "FOSHOOOOO!"
    @cause = Cause.new(params[:cause])
    @cause[:creator] = current_user[:id]
    @cause[:avatar] = current_user[:avatar]

    @cause[:userName] = current_user[:name]
    # logger.debug @cause.inspect
    @author = current_user[:email]
    logger.debug @author

    logger.debug @cause.inspect
    respond_to do |format|
      if @cause.save
        format.html { redirect_to @cause, :flash => {:solution => "nigg"}, notice: 'Cause was successfully created.' }
        format.json { render json: @cause, status: :created, location: @cause }
        # redirect_to cause_path, :method => "GET"
      else
        format.html { redirect_to :back }
        # format.html { render action: "new" }
        # format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /causes/1
  # PUT /causes/1.json
  def update
    @cause = Cause.find(params[:id])

    respond_to do |format|
      if @cause.update_attributes(params[:cause])
        format.html { redirect_to @cause, notice: 'Cause was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /causes/1
  # DELETE /causes/1.json
  def destroy
    @cause = Cause.find(params[:id])
    @cause.destroy

    respond_to do |format|
      format.html { redirect_to causes_url }
      format.json { head :no_content }
    end
  end

  def home
    x = 10
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @cause = Cause.find(params[:id])
    @cause.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting!"
  end

end
