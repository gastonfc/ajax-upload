class FooController < ApplicationController
  attr_accessor :uploaded_file

  def add_file
    { success: false, errors: "Sample" }
  end
  ajax_upload_receiver :add_file

  def custom_response
    { success: false, errors: "Sample" }
  end
  ajax_upload_receiver :custom_response

  def do_nothing

  end

  ajax_upload_receiver :do_nothing

end
