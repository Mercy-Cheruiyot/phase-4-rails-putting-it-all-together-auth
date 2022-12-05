class RecipesController < ApplicationController
    # skip_before_action :authorize
    # before_action:authorize
    def index
        user = User.find(session[:user_id])
        recipes = Recipe.all
        render json:recipes, status: :ok
    end
    def create
        recipe= @current_user.recipes.create!(recipe_params)
        render json: recipe, status: :created

    end
    private
    def recipe_params
        params.permit(:title,:instructions,:minutes_to_complete,:user_id)
    end
    # def authorize
    #     return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    #   end
end