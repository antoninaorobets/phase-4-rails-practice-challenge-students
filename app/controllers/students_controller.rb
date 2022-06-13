class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_find
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_rec

    def index
       students =Student.all 
        render json:students, status: :ok
    end

    def show
       student =Student.find(params[:id])
        render json: student, status: :ok
    end

    def create
       student =Student.create!(student_params)
        render json: student, status: :created
    end

    def update
       student =Student.find(params[:id])
       student.update!(student_params)
        render json: student, status: :created
    end

    def destroy
       student =Student.find(params[:id])
       student.destroy
        render json: {}, status: :no_content
    end

    private 

    def render_invalid_rec invalid 
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def render_not_find  
        render json: {errors: "StudentStudent not found"}, status: :not_found
    end

    def student_params
        params.permit(:name,:age, :major, :instructor_id)
    end
end
