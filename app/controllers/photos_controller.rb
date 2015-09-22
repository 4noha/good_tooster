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
      
      # Rmagickの画処理
      image_magick = Magick::Image.from_blob(params[:image].read).shift
      image_magick.strip!
      image_magick = image_magick.resize_to_fill(400, 640)
      image_magick.format = 'JPG'
      toast.image = Base64.encode64(image_magick.to_blob {self.quality = 70})
      
      toast.save
      return redirect_to controller: :tops
    end
    render text: "error"
  end
end
