# -*- coding: utf-8 -*-
require 'open-uri'

class TopsController < ApplicationController
  def index
    res = open('http://flashair/command.cgi?op=190&CTRL=0x03&DATA=0x03')
    code, message = res.status # res.status => ["200", "OK"]
    
    if code == '200'
      result = ActiveSupport::JSON.decode res.read
      # resultを使ってなんやかんや処理をする
    else
      # だめだった
    end
    @time_lapse = ToastTimeLapse.all
  end
end
