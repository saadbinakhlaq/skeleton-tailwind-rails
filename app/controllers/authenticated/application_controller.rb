class Authenticated::ApplicationController < BaseController
  layout "authenticated"

  before_action :authenticate_user!
end