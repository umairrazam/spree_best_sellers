Spree::ProductsController.class_eval do

  	before_action :load_best_sellers, only: [:index, :show, :best_seller]

  	helper 'spree/taxons'

	def best_seller
		@taxonomies = Spree::Taxonomy.accessible_by(current_ability).order('name').includes(root: :children).
                        ransack(params[:q]).result.
                        page(params[:page]).per(params[:per_page])
		@products = @best_sellers
	end

end