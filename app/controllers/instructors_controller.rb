class InstructorsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_find
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_rec

    def index
        instructors = Instructor.all 
        render json: instructors, status: :ok
    end

    def show
        instructor =Instructor.find(params[:id])
        render json: instructor, status: :ok
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    def update
        instructor =Instructor.find(params[:id])
        instructor.update!(instructor_params)
        render json: instructor, status: :created
    end

    def destroy
        instructor =Instructor.find(params[:id])
        instructor.destroy
        render json: {}, status: :no_content
    end

    private 

    def render_invalid_rec invalid 
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def render_not_find  
        render json: {errors: "instructor not found"}, status: :not_found
    end

    def instructor_params
        params.permit(:name)
    end
end
