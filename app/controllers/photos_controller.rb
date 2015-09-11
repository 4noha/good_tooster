class PhotosController < ApplicationController

  def new
    if params[:time_name].present? 
      @toast = ToastTimeLapse.find_by(mm_ss: params[:time_name])
      @time_name = params[:time_name]
    else
      render text: "error"
    end
  end

  def create
    puts params
    if params[:image].present? && params[:time_name].present? 
      puts params[:time_name].split("\"")[1]
      toast = ToastTimeLapse.find_by(mm_ss: params[:time_name].split("\"")[1])
      puts toast
      toast.image = Base64.encode64(params[:image].read)
      toast.save
      return redirect_to controller: :tops
    end
    render text: "error"
  end
end
