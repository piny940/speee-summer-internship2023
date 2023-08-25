# frozen_string_literal: true

require 'test_helper'

class BranchesControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get branches_show_url
    assert_response :success
  end
end
