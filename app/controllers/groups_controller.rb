class GroupsController < ApplicationController
  before_action :set_group, only: %i(show edit update)
  before_action :authenticate_user!
    # def index
    #     @groups = Group.active.where(id: current_user.group_id)
    # end

    def edit
    end

    def new
        @group = Group.new
    end

    def create
      @group =  Group.new(group_params)
      if @group.save
        current_user.update(group_id: @group.id)
        redirect_to edit_group_path, notice: 'Group was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @group.update(group_params)
        redirect_to group_path, notice: 'Group was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private
    def set_group
      @group = current_user.group
    end

    def group_params
      params.require(:group).permit(:name)
    end
    
end