class ApplicationController < ActionController::Base
    include SessionsHelper
    protect_from_forgery with: :null_session # CSRF保護を無効化する
end
