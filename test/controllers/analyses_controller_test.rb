require "test_helper"

class AnalysesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analysis = analyses(:one)
  end

  test "should get index" do
    get analyses_url, as: :json
    assert_response :success
  end

  test "should create analysis" do
    assert_difference('Analysis.count') do
      post analyses_url, params: { analysis: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show analysis" do
    get analysis_url(@analysis), as: :json
    assert_response :success
  end

  test "should update analysis" do
    patch analysis_url(@analysis), params: { analysis: {  } }, as: :json
    assert_response 200
  end

  test "should destroy analysis" do
    assert_difference('Analysis.count', -1) do
      delete analysis_url(@analysis), as: :json
    end

    assert_response 204
  end
end
