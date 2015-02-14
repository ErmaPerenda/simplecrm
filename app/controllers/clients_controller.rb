class ClientsController < ApplicationController
before_action :require_user
def new
@group=Group.find_by_id(params[:group_id])
@client=@group.clients.build if @group

@subgroup=Subgroup.find_by_id(params[:subgroup_id])
@client=@subgroup.clients.build if @subgroup
end 

def create
@group=Group.find_by_id(params[:group_id])
@client=@group.clients.build(clients_params) if @group

@subgroup=Subgroup.find_by_id(params[:subgroup_id])
@client=@subgroup.clients.build(clients_params) if @subgroup


   if @client.save
        redirect_to user_groups_path(current_user),
          notice: "Client is added!"
    
  else
    render 'new'
  end

end

def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])

    if @client.update(clients_params)
      redirect_to user_groups_path(current_user),
        notice: "Clients information is updated!"
    else
      render 'edit'
    end
  end

 def show
    @client = Client.find(params[:id])
    @note=Note.new
    @notes=@client.notes
    respond_to do |format|
        format.js {}
    end
  end


def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to user_groups_path(current_user),
      notice: "Client is deleted!"
  end


private
	def clients_params
    params.require(:client).permit(:name, :surname, :address, :city, :country, :phone, :fax, :job_position, :email, :company)
  end
end
