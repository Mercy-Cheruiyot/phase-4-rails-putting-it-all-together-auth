class RecipesController < ApplicationController
    # skip_before_action :authorize
    # before_action:authorize
    def index
        render json: Recipe.all
    end
    def create
        recipe= @current_user.recipes.create!(recipe_params)
        render json: recipe, status: :created

    #     recipe =Recipe.create!(recipe_params)
    #     recipe =Recipe.create!((recipe_params) session[:user_id])
    #     render json: recipe, status: :created
    end
    private
    def recipe_params
        params.permit(:title,:instructions,:minutes_to_complete)
    end
    # def authorize
    #     return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    #   end
end
