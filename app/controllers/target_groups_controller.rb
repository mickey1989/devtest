class TargetGroupsController < BaseController
  before_filter :authenticate_user!
  # GET /target_groups/1
  # GET /target_groups/1.json
  def show
    get_target_groups
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def get_target_groups
    country = Country.where(country_code: params[:id]).first
    if country
      target_groups = []
      country.target_groups.each do |target_group|
        find_and_add_child_target_groups(target_group, target_groups)
      end
      return render json: target_groups
    else
      return not_found!
    end
  end

  def find_and_add_child_target_groups(parent_target_group, target_groups)
    child_target_groups = TargetGroup.where(parent_id: parent_target_group.id)
    target_groups.concat child_target_groups

    child_target_groups.each do |target_group|
      find_and_add_child_target_groups(target_group, target_groups)
    end
  end
end