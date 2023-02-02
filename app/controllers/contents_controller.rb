class ContentsController < ApplicationController
    before_action :set_content, only: %i(show edit update destroy)
    before_action :authenticate_user!, only: %i(new create edit update destroy)
    def index
        @contents = Content.active
    end

    def show
    end

    def new
      @content = current_user.contents.new
    end

    def create
      @content = current_user.contents.new(content_params)
      if @content.save
        @content.save_generated_output
        redirect_to contents_path
      else
        render :edit
      end
    end

    def edit

    end

    def update
      if @content.update(content_params)
        @content.save_generated_output
        redirect_to @content
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @content.soft_destroy
      redirect_to contents_path, notice: '削除しました'
    end

    private
    def set_content
        @content = Content.find_by(uid: params[:uid])
    end

    def content_params
        params.require(:content).permit(:input_words)
    end

    
end