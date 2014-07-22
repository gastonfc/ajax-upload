require 'test_helper'
require 'json'

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

  def test_when_method_returns_hash_then_response_is_json
    post 'custom_response'
    assert_equal "application/json", response.content_type
  end

  def test_controller_json_is_a_hash_equivalent
    post 'custom_response'
    assert_equal '{"success":false,"errors":"Sample"}', response.body
  end

  def test_when_method_returns_a_model_then_response_is_json
    post 'model_response', file: fixture_file_upload('arrow_upload.png', 'image/png')
    assert_equal "application/json", response.content_type
  end

  def test_when_model_validation_succeeded_it_should_return_success_true
    post 'model_response', file: fixture_file_upload('arrow_upload.png', 'image/png')
    result = JSON.parse(response.body)
    assert_equal result['success'], true
  end

  def test_when_model_validation_fails_it_should_return_success_false
    post 'model_response'
    result = JSON.parse(response.body)
    assert_equal result['success'], false
  end

  def test_when_model_validation_fails_it_should_return_each_error_once
    post 'model_response', file: fixture_file_upload('fail.txt', 'text/plain')
    result = JSON.parse(response.body)
    assert_equal 1, result['errors'].scan("is invalid").length
  end

  def test_when_the_controller_returns_a_unexpected_value_it_should_return_success_false
    post 'wrong_return_type'
    result = JSON.parse(response.body)
    assert_equal result['success'], false
  end

  def test_when_the_controller_returns_a_unexpected_value_the_error_should_include_the_method_name
    post 'wrong_return_type'
    result = JSON.parse(response.body)
    assert result['errors'].include? "'wrong_return_type'"
  end

  def test_when_the_controller_returns_a_unexpected_value_the_error_should_include_the_values_class
    post 'wrong_return_type'
    result = JSON.parse(response.body)
    assert result['errors'].include? "NilClass"
  end
end
