class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  layout false, :except => [ :index , :edit ]
  # GET /lists
  # GET /lists.json
  def index
    @lists = User.find_by(id: current_user.id).list
    @list = List.new
    render 'lists/index'
  end

  # GET /lists/new
  def new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    if @list.save
      render :text => "OK"
    else
      render :text => @list.errors.to_json
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to lists_path }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    id = @list.id
    @list.destroy
    render :text => id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:title, :description, :user_id)
    end
end
