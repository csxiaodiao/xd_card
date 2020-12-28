# frozen_string_literal: true

require 'wechat/api_base'
require 'wechat/http_client'
require 'wechat/token/public_access_token'
require 'wechat/ticket/public_jsapi_ticket'
require 'wechat/ticket/public_cardapi_ticket'
require 'wechat/concern/common'

module Wechat
  class Api < ApiBase
    def initialize(appid, secret, token_file, timeout, skip_verify_ssl, jsapi_ticket_file, cardapi_ticket_file)
      super()
      @client = HttpClient.new(Wechat::Api::API_BASE, timeout, skip_verify_ssl)
      @access_token = Token::PublicAccessToken.new(@client, appid, secret, token_file)
      @jsapi_ticket = Ticket::PublicJsapiTicket.new(@client, @access_token, jsapi_ticket_file)
      @cardapi_ticket = Ticket::PublicCardapiTicket.new(@client, @access_token, cardapi_ticket_file)
      @qcloud = nil
    end

    include Concern::Common

    def template_message_send(message)
      post('message/template/send', message.to_json, content_type: :json)
    end

    def list_message_template
      get('template/get_all_private_template')
    end

    def add_message_template(template_id_short)
      post('template/api_add_template', JSON.generate(template_id_short: template_id_short))
    end

    def del_message_template(template_id)
      post('template/del_private_template', JSON.generate(template_id: template_id))
    end
  end
end
