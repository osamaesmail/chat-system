class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler

    def pagination_params
        page = 1
        per_page = 100
        if params[:page]
        page = params[:page]
        end
        if params[:per_page]
        per_page = params[:per_page]
        end
        {page: page, per_page: per_page}
    end
end
