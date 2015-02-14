class GroupsController < ApplicationController
 before_action :require_user
	
	def index

		@groups=current_user.groups
		@group = current_user.groups.build
    @grouped=Group.find_by_id(params[:id])
    @subgroup=Subgroup.new
    @client=Client.new

    #all clients for current user
    @clients= Array.new
    #search
   

      @groups.each do |group|

      group.clients.where("name LIKE ? OR surname LIKE? OR company LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%").each do |client|
       @clients.push(client)
      end

     group.subgroups.each do |subgroup|
       subgroup.clients.where("name LIKE ? OR surname LIKE? OR company LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%").each do |client|
       @clients.push(client)
      end
    end

    end
  

    #current_user.groups.delete_all
  end

    def show
    @group = Group.find(params[:id])
    @clients= Array.new

    @group.clients.each do |client|
    @clients.push(client)
    end

     @group.subgroups.each do |subgroup|
       subgroup.clients.each do |client|
       @clients.push(client)
      end
    end
    respond_to do |format|
        format.js {}
    end
  end

 
	def create
    @group = current_user.groups.build(group_params)
   if @group.save
    @subgroup=Subgroup.new
    @client=Client.new
    respond_to do |format|

      format.html do
        redirect_to user_groups_path(current_user),
          notice: "Group is added!"
      end

      format.js do
        render
      end

    end
  else
    render :js => "alert('Group exists or you do not enter a value');"
  end

  end

  def update
     @group=Group.find_by_id(params[:id])
    if @group.update(group_params)
      respond_to do |format|
        format.html do
          redirect_to user_groups_path(current_user),
          notice: "Group is updated!"
        end

        format.js do
         render
        end

      end
    else 
    render :js => "alert('Group exists or you do not enter a value');"
    end

  end


 def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to user_groups_path(current_user),
      notice: "Group is deleted!"
  end

	private
	def group_params
    params.require(:group).permit(:name)
  end

  
end
