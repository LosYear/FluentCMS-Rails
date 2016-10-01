module Fluent
  # Blocks manager
  class Admin::BlocksController < Admin::AdminController
    # Loading model
    before_action :set_block, only: [:show, :edit, :update, :destroy]

    def index
      @blocks_grid = Fluent::Datagrids::BlocksGrid.new(params[:datagrids_blocks_grid]) do |scope|
        scope.page(params[:page])
      end

      respond_to do |format|
        if request.xhr? && !request.wiselinks?
          format.html{render partial: 'grid'}
        else
          format.html # index.html.erb
          format.json {render json: Block}
        end
      end
    end

    def show
    end

    def new
      @block = Block.new
    end

    def edit
    end

    def create
      @block = Block.new(block_params)

      respond_to do |format|
        if @block.save
          format.html { redirect_to admin_blocks_url, notice: 'Block was successfully created.' }
          format.json { render action: 'show', status: :created, location: @block }
        else
          format.html { render action: 'new' }
          format.json { render json: @block.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @block.update(block_params)
          format.html { redirect_to admin_blocks_url, notice: 'Block was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @block.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @block.destroy
      respond_to do |format|
        format.html { redirect_to admin_blocks_url }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_block
      @block = Block.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def block_params
      params.require(:block).permit(:title, :content, :name, :type, :status)
    end
  end
end
