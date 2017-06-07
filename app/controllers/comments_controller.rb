class CommentsController < ApplicationController

	  def create
	    
	    @product = Product.find(params[:product_id])
	    @comment = @product.comments.new(comment_params)

	    respond_to do |format|
	      if @comment.save
	        format.html { redirect_to product_path(@product), notice: 'Comment was successfully created.' }
	        format.json { render :show, status: :created, location: @comment }
	      else
	        format.html { redirect_to product_path(@product), notice: 'Comment was not successfully created.' }
	        format.json { render json: @comment.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  def destroy
	    @comment = Comment.find(params[:id])
	    @comment.destroy
	    respond_to do |format|
	      format.html { redirect_to product_path(@comment.product_id), notice: 'Comment was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	  end

	  private

	    def comment_params
	      params.require(:comment).permit(:title, :author, :content, :rating, :product_id)
	    end

end