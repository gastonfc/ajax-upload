module AjaxUpload
  module Receiver
    extend ActiveSupport::Concern

    included do

    end

    module ClassMethods

      def preba
        puts "hoola"
      end

      def ajax_upload_receiver(method)
        old = "ajax_upload_old_#{method}".to_s

        alias_method old, method

        define_method(method) do
          ajax_upload_get_file
          resp = send old
          ajax_upload_build_response resp
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

      def ajax_upload_build_response(result)
        if result.is_a? Hash
          render json: result
        else
          render text: 'Response'
        end
      end

    end
  end
end

ActionController::Base.send :include, AjaxUpload::Receiver
