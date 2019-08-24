module Spree
  module Api
    class VendorsController < Spree::Api::BaseController

      def index
        @vendors = Vendor.accessible_by(current_ability, :read)
        respond_with(@vendors)
      end

      def create
        authorize! :create, Vendor
        @vendor = Spree::Vendor.create(vendor_params)
        respond_with(@vendor, status: 201, default_template: :show)
      end

      private

      def vendor_params
        params.require(:vendor).permit(:name)
      end

      # def scope
      #   if params[:product_id]
      #     Spree::Product.friendly.find(params[:product_id])
      #   elsif params[:variant_id]
      #     Spree::Variant.find(params[:variant_id])
      #   end
      # end

      def collection
        params[:q] = {} if params[:q].blank?
        vendors = super.order(name: :asc)
        @search = vendors.ransack(params[:q])

        @collection = @search.result.
                      page(params[:page]).
                      per(params[:per_page])
      end
    end
  end
end
