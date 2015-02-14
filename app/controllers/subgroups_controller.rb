class SubgroupsController < ApplicationController
	
 before_action :require_user
	def create
    group = Group.find(params[:group_id])
    
    @subgroup = group.subgroups.build(subgroup_params)
     if @subgroup.save
     
      respond_to do |format|
      format.html do
        redirect_to user_groups_path,
          notice: "Subgroup is added!"
      end
      format.js do
        render
      end
    end
  else
  render :js => "alert('Subgroup exists or you do not enter a value');"
end
  end

  def show
    @subgroup = Subgroup.find(params[:id])
    @clients= Array.new

    @subgroup.clients.each do |client|
    @clients.push(client)
    end

    respond_to do |format|
        format.js {}
    end
  end


    def update
     @subgroup=Subgroup.find_by_id(params[:id])
    if @subgroup.update(subgroup_params)
      respond_to do |format|
        format.html do
          redirect_to user_groups_path,
          notice: "Subgroup is updated!"
        end

        format.js do
         render
        end

      end
    else 
      render :js => "alert('Subgroup exists or you do not enter a value');"
    end
  end
  

  def destroy
    @subgroup = Subgroup.find(params[:id])
    @subgroup.destroy
    redirect_to user_groups_path(current_user),
      notice: "Subgroup is deleted!"
  end

private
	def subgroup_params
    params.require(:subgroup).permit(:name)
  end

end
