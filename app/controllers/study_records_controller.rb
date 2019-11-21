class StudyRecordsController < ApplicationController

  def index
    @study_records = StudyRecord.all
  end

  def new
    @category = Category.where(user_id: current_user.id)
    @study_record = StudyRecord.new
  end

  def create
    study_record = StudyRecord.new(study_record_params)
    study_record.study_time = Time.at(hour = params[:study_record][:hour].to_i, min = params[:study_record][:min].to_i)

    if study_record.save
      flash[:success] = "勉強記録を保存しました"
      redirect_to user_index_url
    else
      flash[:danger] = "sippai"
      redirect_to new_study_record_url
    end
  end

  private
  def study_record_params
    params.require(:study_record).permit(:category_id, :title, :comment,  :user_id)
  end

end
