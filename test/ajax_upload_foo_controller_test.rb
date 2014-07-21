require 'test_helper'

class AjaxUploadFooControllerTest < ActionController::TestCase
  tests FooController


  # Private methods tests

  def test_instance_has_a_get_file_method
    assert @controller.respond_to? :ajax_upload_get_file, true
  end

  def test_ajax_upload_get_file_sets_uploaded_file
    @controller.uploaded_file = nil

    post 'do_nothing', file: fixture_file_upload('arrow_upload.png', 'image/png')
    assert @controller.uploaded_file
  end

  def test_when_method_returns_hash_then_controller_returns_json
    post 'custom_response'
    assert response.content_type = "application/json"
  end

  def test_controller_json_is_a_hash_equivalent
    post 'custom_response'
    assert_equal '{"success":false,"errors":"Sample"}', response.body
  end

end
