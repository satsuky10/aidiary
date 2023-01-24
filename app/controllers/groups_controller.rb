class GroupsController < ApplicationController
  before_action :set_group, only: %i(edit update destroy)  
    def index
        @groups = Group.active
    end

    def new
        @group = Group.new
    end

    def create
      @group =  Group.new(group_params)
      if @group.save
        redirect_to groups_path, notice: 'Group was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @group.update(group_params)
        redirect_to groups_path, notice: 'Group was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @group.soft_destroy
        redirect_to groups_path, notice: 'deleted'
      else
        redirect_to groups_path, alert: 'can\'t delete'
      end
    end

    private
    def set_group
      @group = Group.find_by(uid: params[:uid])
    end

    def group_params
      params.require(:group).permit(:name)
    end
    
end