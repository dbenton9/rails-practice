class PostsController < ApplicationController
    

    def index
        @new_post = Post.new
        @all_posts = Post.order(created_at: :desc).all
    end

    def create
        @new_post = Post.new(post_params)
      if @new_post.save
          redirect_to root_path
      end
    end

    def edit
        @article = Post.find(params[:id])
        # See INDEX.HTML.ERB for instructions
        # @old_comments = Post.find(params[:id])
    end

    def update
        @article = Post.find(params[:id])
        permitted_columns = params.require(:post).permit(:comment)
        @article.update_attributes(permitted_columns) #see step 18
        redirect_to root_path
    end

    def destroy
        @deleted_post = Post.find(params[:id])
        if @deleted_post.delete
            redirect_to root_path
        end
    end

    private
    def post_params
        params.require(:post).permit(:comment)
    end
end
