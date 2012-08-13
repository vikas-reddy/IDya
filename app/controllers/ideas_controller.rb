class IdeasController < ApplicationController
  # GET /ideas
  # GET /ideas.json
	#before_filter :apply_validations
  respond_to :html, :json, :xml
  def index
    params[:filter_by] ||= :today
    params[:order_by]   ||= :created_date

    @ideas = Idea.filter(params[:filter_by]).page(params[:page] || 1).per(5)

    if request.xhr?
       render :partial => 'ideas/list'
    else
      respond_with(@users)
    end
  end
	def search
		@valid_search = params[:q] && !params[:q].strip.empty?
		if @valid_search
			@ideas = Idea.full_text_search(params[:q]).page(params[:page]).per(Idea.per_page)
		else
			flash.now[:notice] = t(:empty_search)
		end
		respond_with(@ideas)
	end
  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])
    respond_with(@idea)
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = Idea.new
    respond_with(@idea)
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(params[:idea])
		@idea.username = current_user.ldap_name
    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render json: @idea, status: :created, location: @idea }
      else
        format.html { render action: "new" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end
end
