require 'open-uri'

# -*- coding: utf-8 -*-
class ApisController < ApplicationController
  def op
    if "bake" == params[:op]
      self.bake
    elsif "release" == params[:op]
      self.release
    end
    render json: {time_name: params[:time_name], result: true}
  end
  
  def bake
    res = open('http://flashair/command.cgi?op=190&CTRL=0x03&DATA=0x02')
    code, message = res.status # res.status => ["200", "OK"]
    
    if code == '200'
      result = ActiveSupport::JSON.decode res.read
      # resultを使ってなんやかんや処理をする
    else
      # だめだった
    end
  end

  def release
    res = open('http://flashair/command.cgi?op=190&CTRL=0x03&DATA=0x01')
    code, message = res.status # res.status => ["200", "OK"]
    
    if code == '200'
      result = ActiveSupport::JSON.decode res.read
      # resultを使ってなんやかんや処理をする
    else
      # だめだった
    end
  end
end
