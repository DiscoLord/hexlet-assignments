# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  # Setup fixtures
  setup do
    @bulletin = bulletins(:bulletin_one)
  end

  # Test the index action
  test 'should get index' do
    get bulletins_url
    assert_response :success
    assert_select 'h1', 'Bulletins' # Check if the page contains the heading
    assert_select 'h4', Bulletin.count # Check if the list contains the correct number of bulletins
  end

  # Test the show action
  test 'should show bulletin' do
    get bulletin_url(@bulletin)
    assert_response :success
    assert_select 'h1', @bulletin.title # Check if the page displays the bulletin title
    assert_select 'p', @bulletin.body # Check if the page displays the bulletin body
  end
end
