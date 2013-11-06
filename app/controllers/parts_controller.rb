class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, except: [:index, :show]
  #before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @parts = Part.all
  end

  def show
  end

  def new
    @part = Part.new
  end

  def edit
  end

  def create
   @part = Part.create(part_params)

  # @part = Machine.create(:name => 'm').parts.create(part_params)

    respond_to do |format|
      if @part.save
        format.html { redirect_to @part, notice: 'Part was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  #def correct_user
    #@part = current_user.parts.find_by(id: params[:id])
    #redirect_to parts_path, notice: 'Not Authorized to use this' if @part.nil?
  #end

  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to @part, notice: 'Part was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  def destroy
    @part.destroy
    respond_to do |format|
      format.html { redirect_to parts_url }
    end
  end

  private
    def set_part
      @part = Part.find(params[:id])
    end

    def part_params
      params.require(:part).permit(:name, :machine_id)
    end
end
