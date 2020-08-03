class EmailInformationController < ApplicationController
  
  def create
    h = JSON.generate("email" => params[:email])
    InforWorker.perform_at(1.minute.from_now, h)
    flash[:success] = t "static_pages.send_email.success"
    redirect_to root_path
  end
end
