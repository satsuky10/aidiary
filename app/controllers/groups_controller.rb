class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end

    def show
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

    def update
    end

    def destroy
    end

    private
    def group_params
      params.require(:group).permit(:name)
    end
    
end