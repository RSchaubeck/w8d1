class SubsController < ApplicationController

    before_action :is_moderator?, only: [:edit, :update]

    def update
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def edit
        @sub = Sub.find(params[:id])
    end

    def is_moderator?
        return true if current_user.subs.find(params[:id])
        false
    end

    private

    def sub_params
        params.require(:sub).permit(:name, :description)
    end

end