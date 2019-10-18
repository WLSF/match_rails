class LawyersRequestController < LawyersBackofficeController
  
  def index
    @users = User
      .joins(:request)
      .where(
        brazilian_state_id: current_lawyer.brazilian_state_id, 
        lawyer_id: nil 
      )
  end

  def my_list
    @users = User.where(lawyer_id: current_lawyer.id)
  end

  def accept
    current_lawyer.users << User.find_by(id: params[:id])
    current_lawyer.save  
    redirect_to lawyers_request_index_path 
  end
end