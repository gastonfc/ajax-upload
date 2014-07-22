
module AjaxUpload

  module Utils

    def self.get_activerecord_errors(ar)
      errors = ar.errors
      attributes = ar.attribute_names
      messages = []

      errors.keys.each do |key|
        messages.push(errors.full_messages_for(key)) if attributes.include? key.to_s
      end

      return messages
    end
  end
end
