
module AjaxUpload
  module Receiver
    extend ActiveSupport::Concern

    included do

    end

    module ClassMethods

      def ajax_upload_receiver(method)
        old = "ajax_upload_old_#{method}".to_s

        alias_method old, method

        define_method(method) do
          ajax_upload_get_file
          resp = send old
          ajax_upload_build_response resp, method
        end

        include AjaxUpload::Receiver::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods


    private
      def ajax_upload_get_file
        upload = params[:upload] || params
        @uploaded_file = upload['file']
      end

      def ajax_upload_build_response(result, method)
        if result.is_a? ActiveRecord::Base
          if result.valid?
            render json: { success: true }
          else
            errors = AjaxUpload::Utils::get_activerecord_errors(result)
            render json: { success: false, errors: errors.join(". ") }
          end
        elsif result.is_a? Hash
          render json: result
        else
          render json: { success: false, errors: "Unknown return type (#{result.class}) for method '#{method}' (ajax_upload)" }
        end
      end
    end
  end
end

ActionController::Base.send :include, AjaxUpload::Receiver
