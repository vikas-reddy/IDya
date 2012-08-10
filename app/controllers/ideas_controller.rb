class IdeasController < ApplicationController
  # GET /ideas
  # GET /ideas.json
  def index
    params[:criteria] ||= :today
    @ideas = case params[:criteria].to_sym
             when :today, nil
               Idea.today
             when :last_week
               Idea.last_week
             when :last_month
               Idea.last_month
             else # All
               Idea.scoped
             end

    @ideas = @ideas.page(params[:page] || 1).per(5)

    if request.xhr?
       render :partial => 'ideas/list'
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @ideas }
      end
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idea }
    end
  end

=begin #edit and update are not required
  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end
=end
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
