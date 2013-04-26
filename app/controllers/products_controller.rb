class ProductsController < ApplicationController
  before_filter :authenticate_user!, :except =>[:show]
  respond_to :html, :js, :json
  # GET /products
  # GET /products.json
  def index
    @products = Product.order("created_at desc").paginate(page: params[:page], per_page: 21)

    respond_with @products
  end

  def purchase
    @products = current_user.purchase_products.paginate(page: params[:page], per_page: 21)
    @tab1_status = "active"
    respond_to do |format|
      format.html { render action: "index" }
      format.json { render json: @products }
    end
  end

  def favor
    @products = current_user.favor_products.paginate(page: params[:page], per_page: 21)
    @tab2_status = "active"
    respond_to do |format|
      format.html { render action: "index" }
      format.json { render json: @products }
    end
  end

  def uploaded
    @products = current_user.uploaded_products.paginate(page: params[:page], per_page: 21)
    @tab3_status = "active"
    respond_to do |format|
      format.html { render action: "index" }
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @category = @product.category
    respond_with @product
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_with @product
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @product.edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { head :no_content }
        create_rs(current_user.id, @product.id, "uploaded")
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_favor
    create_rs(current_user.id, params[:id], "favor")
    @product = Product.find(params[:id])
    respond_with @product
  end

  def cancel_favor
    drop_rs(current_user.id, params[:id], "favor")
    @product = Product.find(params[:id])
    respond_with @product
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    drop_rs(current_user.id, params[:id], "uploaded")
    @product.destroy

    respond_to do |format|
      format.html { redirect_to uploaded_products_path }
      format.json { head :no_content }
    end
  end

  # comments
  def comments
    @comments = Product.find(params[:id]).comments
  end

  def add_comment
    p = Product.find(params[:id])
    c = Comment.new(params[:comment])
    c.user_id = current_user.id
    c.save
    p.comments << c
    redirect_to product_path(p), notice: 'Comment was successfully added.'
  end

  def remove_comment
    c = Comment.find(params[:comment_id])
    p =  Product.find(params[:id])
    p.comments.delete(c)
    redirect_to product_path(p), notice: 'Comment was successfully deleted.'
  end

  private
  def create_rs(user_id,product_id,rs_type)
    rs = ProductRelation.new
    rs.user_id = user_id
    rs.product_id = product_id
    rs.rs_name = rs_type
    rs.save if ProductRelation.find_by_user_id_and_product_id_and_rs_name(user_id, product_id, rs_type).nil?
  end

  def drop_rs(user_id,product_id,rs_type)
    rs = ProductRelation.find_by_user_id_and_product_id_and_rs_name(user_id, product_id, rs_type)
    rs.destroy
  end

end
