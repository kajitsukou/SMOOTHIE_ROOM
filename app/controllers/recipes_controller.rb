class RecipesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @search = Recipe.ransack(params[:q])
    @recipes = @search.result.page(params[:page]).reverse_order
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
    @recipe_comment = RecipeComment.new
    @recipe_comments = @recipe.recipe_comments
  end

  def new
  	@recipe = Recipe.new
  end

  def create
  	@recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
  	  if @recipe.save
        redirect_to recipe_path(@recipe), notice: "レシピを投稿しました"
      else
        @recipes = Recipe.all
        render 'new'
      end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    if @recipe.user.id != current_user.id
    redirect_to recipes_path
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: "レシピを編集しました"
    else
      render "edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :catchphrase, :ingredient, :method, :smoothie_image )
  end

end
