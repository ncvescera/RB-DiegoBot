#!/usr/bin/ruby
# encoding: utf-8

require 'telegram/bot'
#require_relative 'settings/token'

token = "266306542:AAEPi-o5Kh91-abpVdKuRGJI8UqMFtJNFkg"

Telegram::Bot::Client.run(token) do |bot|
	bot.listen do |message|
		#Saluto iniziale quando viene avviato per la prima volta
		if message.text.to_s.include?("/start")
			bot.api.send_message(chat_id: message.chat.id, text: "HEEEEEY LEZZZZISSIMOOOO COSA CAZZO VUOI ?!?!\nSe devi rompere il cazzo fallo per bene ed usa /help e non fare l'AMEBAH!")
		end
		#Saluto con ciao,hey,bella,wue
		if message.text.to_s.downcase.include?("ciao") || message.text.to_s.downcase.include?("bella") || message.text.to_s.downcase.include?("wue") || message.text.to_s.downcase.include?("hey") || message.text.to_s.downcase.include?("hola") || message.text.to_s.downcase.include?("salve")
			case Random.rand(0...2)
				when 0
					 bot.api.send_message(chat_id: message.chat.id, text: 'Ciao lezzo !!')
				when 1
					 bot.api.send_message(chat_id: message.chat.id, text: 'Salve brutta ameba !')
				when 2
					bot.api.send_message(chat_id: message.chat.id, text: 'Hey sudicio !')
			end
		end

	end
end

