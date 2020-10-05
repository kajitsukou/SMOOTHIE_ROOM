class RecipeCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
      @recipe = Recipe.find(params[:recipe_id])
      @recipe_comment = current_user.recipe_comments.new(recipe_comment_params)
      @recipe_comment.recipe_id = @recipe.id
      if @recipe_comment.save
        flash[:success] = "Comment was successfully created."
      end
      redirect_to request.referer
    end

    def destroy
      @recipe = Recipe.find(params[:recipe_id])
      recipe_comment = current_user.recipe_comments.find_by(id: params[:id], recipe_id: @recipe.id)
      recipe_comment.destroy
      redirect_to request.referer
    end

    private

    def recipe_comment_params
      params.require(:recipe_comment).permit(:comment)
    end

end
