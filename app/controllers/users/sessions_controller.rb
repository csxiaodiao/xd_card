# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def new
    render :new_with_auto_redriect_to
  end

end
