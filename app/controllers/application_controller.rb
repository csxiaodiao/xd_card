# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protected
    def after_sign_in_path_for(resource)
      card_path
    end

    def after_sign_out_path_for(scope)
      root_path
    end
end
