# Ruby version oh the chillispot login page.
# 14/07/2015 Bravo Simone.

class HotspotController < ApplicationController

  def index
  end

  def login
    @user = Hotspot.koala(request.env['omniauth.auth']['credentials'])
  end
end
