require 'test_helper'

class IdeasControllerTest < ActionController::TestCase
  setup do
    @idea = ideas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ideas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create idea" do
    assert_difference('Idea.count') do
      post :create, idea: { description: @idea.description, id: @idea.id, title: @idea.title, user_id: @idea.user_id }
    end

    assert_redirected_to idea_path(assigns(:idea))
  end

  test "should show idea" do
    get :show, id: @idea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @idea
    assert_response :success
  end

  test "should update idea" do
    put :update, id: @idea, idea: { description: @idea.description, id: @idea.id, title: @idea.title, user_id: @idea.user_id }
    assert_redirected_to idea_path(assigns(:idea))
  end

  test "should destroy idea" do
    assert_difference('Idea.count', -1) do
      delete :destroy, id: @idea
    end

    assert_redirected_to ideas_path
  end

	# tests for ideas#search
	test "should get search" do
		get :search, q: "asdf"
		assert_response :success
	end
	
	test "should return empty results" do
		get :search, q: "pleasedontcreateanypostwiththisstringplesepleasepleasepleasepleaserfdklfj;alsdfjlksdjfljsdflkjsdflksdjf;lksadjf;lsdkjf;lsadkfj"
		assert_response :success
		assert_equal flash[:notice], I18n.t(:no_results)
		assert assigns[:ideas].empty?
	end
	test "should not search for empty strings" do
		get :search, q: " "
		assert_response :success
		assert_equal flash[:notice], I18n.t(:empty_search)
		assert_nil assigns[:ideas]
	end

	test "should search for valid string" do
		get :search, q: "searchable"
		assert_response :success
		assert_nil flash[:notice]
		assert_not_nil assigns[:ideas]
	end
end
