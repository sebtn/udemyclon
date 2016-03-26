class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_authorized_for_current_lesson, only: [:show]	

	def new
		@Lesson = Lesson.new
	end	

	def create
		@lesson = current_user.lessons.create(lesson_params)
			if current_user enrolled_in?
			else
				redirect_to course_path(@course)
			end	
	end	

  def show
  end

  private
  def require_authorized_for_current_lesson
    if current_lesson_user != current_user
     rederict_to course_path, alert: 'Error Message Here'
    end
  end  
  helper_method :current_lesson

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end	

end
