module Api::V1
	class ProficienciesController < ApplicationController
		before_action :set_proficiency, only: [:show, :update, :destroy]
	
	  # GET /proficiencies
	  def index
			@proficiencies = Proficiency.order(id: :desc)
		
			render json: @proficiencies
	  end
	
	  # GET /proficiencies/1
	  def show
			render json: @proficiency
	  end
	
	  # POST /proficiencies
	  def create
			@proficiency = Proficiency.new(proficiency_params)
		
			if @proficiency.save
				render json: @proficiency, status: :created
			else
				render json: @proficiency.errors, status: :unprocessable_entity
			end
	  end
	
	  # PATCH/PUT /proficiencies/1
	  def update
			if @proficiency.update(proficiency_params)
				render json: @proficiency
			else
				render json: @proficiency.errors, status: :unprocessable_entity
			end
	  end
	
	  # DELETE /proficiencies/1
	  def destroy
			@proficiency.destroy
			if @proficiency.destroy
				head :no_content, status: :ok
			else
				render json: @proficiency.errors, status: :unprocessable_entity
			end      
	  end
	
	  private
		# Use callbacks to share common setup or constraints between actions.
		def set_proficiency
		  @proficiency = Proficiency.find(params[:id])
		end
	
		# Only allow a trusted parameter "white list" through.
		def proficiency_params
		  params.require(:proficiency).permit(:level, :user_id, :language_id)
		end
		
	end
end  