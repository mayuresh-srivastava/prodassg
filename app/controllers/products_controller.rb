class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	before_action :authenticate, except: [:index, :show]
	def index
		@products = Product.page(params['page']).order(:updated_at => :desc)
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

		respond_to do |format|
		  if @product.save
		    format.html { redirect_to @product, notice: 'Product was successfully created.' }
		    format.json { render :show, status: :created, location: @product }
		  else
		    format.html { render :new }
		    format.json { render json: @product.errors, status: :unprocessable_entity }
		  end
		end
	end

	def show
		@comment = Comment.new
	end

	def edit
	end

	def update
		respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
	end

	private

		def set_product
		  @product = Product.find(params[:id])
		end

		def product_params
		  params.require(:product).permit(:name, :price, :description, :color, :quantity, :image, :weight)
		end

		def authenticate
      authenticate_user! && current_user.try(:is_admin?)
    end

end