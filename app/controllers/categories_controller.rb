class CategoriesController < SecuredController
  skip_before_action :authorize_request, only: [:index, :show]
end