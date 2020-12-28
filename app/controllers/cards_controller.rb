# frozen_string_literal: true

class CardsController < BaseController
  wechat_api
  def show
    ey = ["pXlZ2uEGpCUDaXx5MZhUmtrGubWw", "pXlZ2uLqWxu0J8L72JWvOFwEeVhY"].sample

    xf = ["pXlZ2uHmYE2FhO769IfHYwpxEzZs", "pXlZ2uKIj_PNuV-6Sa_Ob5GMtV2Q"].sample

    zz = ["pXlZ2uF5TLGecvh7AfcfdPaDwQ3g", "pXlZ2uOWfa7r4tqjyMCa1vsK4hI4"].sample

    jz = ["pXlZ2uDjZJoW7qjjJ31aVbbE8nCA", "pXlZ2uGc6WmBgdFEp_xwqmRYxN1o"].sample

    mb = ["pXlZ2uMRHSkIGPH_EPvnE3pwiH70", "pXlZ2uMlaQ3vui6nri4IizhZwfrI"].sample

    @eycard = Wechat.api.cardapi_ticket.card_sign(id: ey)
    @xfcard = Wechat.api.cardapi_ticket.card_sign(id: xf)
    @zzcard = Wechat.api.cardapi_ticket.card_sign(id: zz)
    @jzcard = Wechat.api.cardapi_ticket.card_sign(id: jz)
    @mbcard = Wechat.api.cardapi_ticket.card_sign(id: mb)
  end
end
