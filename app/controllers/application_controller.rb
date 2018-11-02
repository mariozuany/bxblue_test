class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> {request.format.json?}
  helper_method :current_user
  helper_method :asset_exist?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to login_path, notice: 'Not authorized.' if current_user.nil?
  end

  # Needs this method because if in Production Envioriment the
  # Rails.application.precompiled_assets.include? method doesn't work.
  def asset_exist?(path)
    if Rails.configuration.assets.compile
      Rails.application.precompiled_assets.include? path
    else
      Rails.application.assets_manifest.assets[path].present?
    end
  end
end
