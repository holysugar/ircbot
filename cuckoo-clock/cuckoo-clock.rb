#!/usr/bin/env ruby
# coding: utf-8
require 'active_support/core_ext'
require 'carrier-pigeon'

now = Time.now
target = now.advance(:hours => 1).change(:min => 0, :sec => 0, :msec => 0)
diff = ((target - now) / 60 + 1).to_i

if diff >= 60
  message = "#{now.hour}時ちょうどくらいをお知らせします。"
else
  message = "#{target.hour}時の#{diff}分前くらいをお知らせします。"
end

CarrierPigeon.send(
  :uri => "irc://NICK:PASSWORD@HOSTNAME:PORT/#CHANNEL",
  :message => "✘╹◡╹✘ < #{message} ",
  :ssl => true,
  :notice => true
)
