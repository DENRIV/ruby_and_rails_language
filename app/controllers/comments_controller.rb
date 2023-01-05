class CommentsController < ApplicationController

    # added 1
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
      end

       # added 2
      def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article), status: :see_other
      end
      # added end 2
    
      private
        def comment_params
          #params.require(:comment).permit(:commenter, :body)
          params.require(:comment).permit(:commenter, :body, :status)
        end
    # added end 1
end
