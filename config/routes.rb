# frozen_string_literal: true

Rails.application.routes.draw do
  resource :wechat, only: [:show, :create]

  devise_for :users, controllers: { 
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks" 
  }

  resource :card

  root "main#home"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
