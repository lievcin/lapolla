require 'test_helper'

class TournamentCountriesControllerTest < ActionController::TestCase
  setup do
    @tournament_country = tournament_countries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tournament_countries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tournament_country" do
    assert_difference('TournamentCountry.count') do
      post :create, tournament_country: { country_id: @tournament_country.country_id, tournament_id: @tournament_country.tournament_id }
    end

    assert_redirected_to tournament_country_path(assigns(:tournament_country))
  end

  test "should show tournament_country" do
    get :show, id: @tournament_country
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tournament_country
    assert_response :success
  end

  test "should update tournament_country" do
    put :update, id: @tournament_country, tournament_country: { country_id: @tournament_country.country_id, tournament_id: @tournament_country.tournament_id }
    assert_redirected_to tournament_country_path(assigns(:tournament_country))
  end

  test "should destroy tournament_country" do
    assert_difference('TournamentCountry.count', -1) do
      delete :destroy, id: @tournament_country
    end

    assert_redirected_to tournament_countries_path
  end
end
