class BaseController < ApplicationController
  
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    #protect_from_forgery with: :null_session
    before_action :destroy_session

    rescue_from ActiveRecord::RecordNotFound, with: :not_found!
    
    def destroy_session
        request.session_options[:skip] = true
      end

    def not_found!
        return api_error(status: 404, errors: 'Not found')
    end

    def unauthenticated!
        response.headers['WWW-Authenticate'] = "Token realm=Application"
        render json: { error: 'Bad credentials' }, status: 401
      end

    def api_error(status: 500, errors: [])
        unless Rails.env.production?
          puts errors.full_messages if errors.respond_to? :full_messages
        end
        head status: status and return if errors.empty?
    
        render json: jsonapi_format(errors).to_json, status: status
      end

    def jsonapi_format(errors)
    return errors if errors.is_a? String
    errors_hash = {}
    errors.messages.each do |attribute, error|
        array_hash = []
        error.each do |e|
        array_hash << {attribute: attribute, message: e}
        end
        errors_hash.merge!({ attribute => array_hash })
    end

    return errors_hash
    end

    def authenticate_user!
        
        email_for_authentication = 'test@test.com'
        token_for_authentication = Base64.urlsafe_encode64('testtoken')
        token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
    
        user_email = options.blank?? nil : options[:email]

        unless user_email == email_for_authentication && ActiveSupport::SecurityUtils.secure_compare(token_for_authentication, token)
            return unauthenticated!
        end
      end
    
end