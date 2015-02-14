class NotesController < ApplicationController
 before_action :require_user
	def create
    client = Client.find(params[:client_id])
    
    @note = client.notes.build(notes_params)
     if @note.save
     
      respond_to do |format|
      format.html do
        redirect_to user_groups_path,
          notice: "Note is added!"
      end
      format.js do
        render 
      end
    end
  else
  render :js => "alert('You must enter title and body!');"
end
  end

  def destroy
  	
  	@note=Note.find(params[:id])
  	@pom=@note
  	@note.destroy
  	
  	 respond_to do |format|
      format.html do
        redirect_to user_groups_path,
          notice: "Note is deleted!"
      end
      format.js do
        render 
      end
    end

  end


  private
	def notes_params
    params.require(:note).permit(:title, :body, :client_id)
  end

end
