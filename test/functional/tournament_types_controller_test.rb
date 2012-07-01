require 'test_helper'

class TournamentTypesControllerTest < ActionController::TestCase
  setup do
    @tournament_type = tournament_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tournament_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tournament_type" do
    assert_difference('TournamentType.count') do
      post :create, tournament_type: { name: @tournament_type.name }
    end

    assert_redirected_to tournament_type_path(assigns(:tournament_type))
  end

  test "should show tournament_type" do
    get :show, id: @tournament_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tournament_type
    assert_response :success
  end

  test "should update tournament_type" do
    put :update, id: @tournament_type, tournament_type: { name: @tournament_type.name }
    assert_redirected_to tournament_type_path(assigns(:tournament_type))
  end

  test "should destroy tournament_type" do
    assert_difference('TournamentType.count', -1) do
      delete :destroy, id: @tournament_type
    end

    assert_redirected_to tournament_types_path
  end
end
