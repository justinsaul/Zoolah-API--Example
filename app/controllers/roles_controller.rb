class RolesController < ApplicationController
  # GET /roles
  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /roles/1
  # GET /roles/1.xm
  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /roles/new
  def new
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /roles/1/edit
  def edit
    @role = Role.find(params[:id])
  end

  # POST /roles
  def create
    @role = Role.new(params[:role])

    respond_to do |format|
      if @role.save
        flash[:notice] = 'Role was successfully created.'
        format.html { redirect_to(@role) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /roles/1
  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        flash[:notice] = 'Role was successfully updated.'
        format.html { redirect_to(@role) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /roles/1
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to(roles_url) }
    end
  end
end
