class IdeasController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:search] != nil && params[:search] != ''
      
      search = params[:search]
      @ideas = Idea.where("name LIKE ? OR place LIKE ? OR people LIKE ?",'%' "%#{search}%", "%#{search}%", "%#{search}%")
    else
      @ideas = Idea.all
    end
  end
      def create
        idea = Idea.new(idea_params)
        idea.user_id = current_user.id
        if idea.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      def new
        @idea = Idea.new
      end
      def show
        @idea = Idea.find(params[:id])
        @comments = @idea.comments
        @comment = Comment.new
      end
      def edit
        @idea = Idea.find(params[:id])
      end
      def update
        idea = Idea.find(params[:id])
        if idea.update(idea_params)
          redirect_to :action => "show", :id => idea.id
        else
          redirect_to :action => "new"
        end
      end
      def destroy
        idea = Idea.find(params[:id])
        idea.destroy
        redirect_to action: :index
      end
      private
      def idea_params
        params.require(:idea).permit(:name, :place, :people, :review, :image)
      end
    end
