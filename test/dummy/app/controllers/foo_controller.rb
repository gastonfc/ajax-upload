class FooController < ApplicationController
  attr_accessor :uploaded_file

  def custom_response
    { success: false, errors: "Sample" }
  end
  ajax_upload_receiver :custom_response

  def model_response
    foo = Foo.new(image: params['file'])
    foo.save
    foo
  end
  ajax_upload_receiver :model_response

  def do_nothing

  end

  ajax_upload_receiver :do_nothing
end
