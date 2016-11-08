#!/usr/bin/ruby
# encoding: utf-8

require 'telegram/bot'
require 'daemons'

#path assoluto della cartella in cui risiede lo script
absolute_path = ARGV[0]

#token di accesso per telegram
config_file = absolute_path+'settings/token.rb'
require config_file if File.file? config_file
TOKEN ||= '.'

Telegram::Bot::Client.run(TOKEN) do |bot|
	bot.listen do |message|
		#Saluto iniziale quando viene avviato per la prima volta
		if message.text.to_s.include?("/start")
			bot.api.send_message(chat_id: message.chat.id, text: "HEEEEEY LEZZZZISSIMOOOO COSA CAZZO VUOI ?!?!\nSe devi rompere il cazzo fallo per bene ed usa /help e non fare l'AMEBAH!")
		end

		#Saluto con ciao,hey,bella,wue
		if message.text.to_s.downcase.include?("ciao") || message.text.to_s.downcase.include?("bella") || message.text.to_s.downcase.include?("wue") || message.text.to_s.downcase.include?("hey") || message.text.to_s.downcase.include?("hola") || message.text.to_s.downcase.include?("salve")
			case Random.rand(0...3) #parte dal primo numero fino al secondo - 1
				when 0
					 bot.api.send_message(chat_id: message.chat.id, text: 'Ciao lezzo !!')
				when 1
					 bot.api.send_message(chat_id: message.chat.id, text: 'Salve brutta ameba !')
				when 2
					bot.api.send_message(chat_id: message.chat.id, text: 'Hey sudicio !')
			end
		end

		#gratuito o gratuito?
		if message.text.to_s.downcase.include?("gratuito") || message.text.to_s.downcase.include?("gratuìto")
			case Random.rand(0...11)
				when 0..9
					bot.api.send_message(chat_id: message.chat.id, text: "Gratuìto. GRA TU ì TO ! CAZZO !")
				when 10
					bot.api.send_message(chat_id: message.chat.id, text: "Gratuito ameba !")
			end
		end

		#palesati
		if message.text.to_s.downcase.include?("palesati") && message.text.to_s.downcase.include?("diego")
			case Random.rand(0...3)
			when 0
				bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new(absolute_path+'media/diego1.jpg', 'image/jpg'))
			when 1
				bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new(absolute_path+'media/diego2.jpg', 'image/jpg'))
			when 2
				bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new(absolute_path+'media/diego3.jpg', 'image/jpg'))
			end
		end
		
		#un tumore
		if message.text.to_s.downcase.include?("tumore")
			bot.api.send_voice(chat_id: message.chat.id, voice: Faraday::UploadIO.new(absolute_path+'media/audio2.mp3', 'audio/mp3'))
		end

		#tumora persona
		if message.text.to_s.downcase.include?("tumora")
			i_tumora = message.text.to_s.downcase.index('tumora')+7
			boy = message.text.to_s[i_tumora,message.text.to_s.length-1]
			#boy = message.text.to_s[(i_tumora + 7),message.text.to_s.length-1]
			
			if boy.to_s == ''
				bot.api.send_message(chat_id: message.chat.id, text: "#{message.from.first_name} sei un coglione ! Come faccio a mandare un tumore a nessuno !?!?!")
			elsif boy.to_s.downcase == 'diego'
				case Random.rand(0...2)
				when 0
					bot.api.send_message(chat_id: message.chat.id, text: "#{message.from.first_name} sei simpatico quanto un edema polmonare !!")
				when 1
					bot.api.send_message(chat_id: message.chat.id, text: "Stai zitto, CANCER !!")
				end
			else
				case Random.rand(0...3)
				when 0
					bot.api.send_message(chat_id: message.chat.id, text: "#{boy} spero che ti prenda un bel tumore, un bel tumore !")
				when 1
					bot.api.send_message(chat_id: message.chat.id, text: "#{boy} spero che ti prenda un bel tumore, ma di quelli grossi eh !")
				when 2
					bot.api.send_message(chat_id: message.chat.id, text: "Ora #{boy} ti mando un bel tumore, un bel tumore !")
				end
			end
		end
					
		#hobbes
		if message.text.to_s.downcase.include?("hobbes")
			bot.api.send_message(chat_id: message.chat.id, text: "Il caro Thomas Hobbes dice che l'uomo è lupo all'altro uomo")
		end		
		
		#grillo
		if message.text.to_s.downcase.include?("grillo") || message.text.to_s.downcase.include?("beppe") || message.text.to_s.downcase.include?("grillino") || message.text.to_s.downcase.include?("grillini") || message.text.to_s.downcase.include?("movimento 5 stelle") || message.text.to_s.downcase.include?("movimento cinque stelle") || message.text.to_s.downcase.include?("m5s")
			bot.api.send_message(chat_id: message.chat.id, text: "Ah si? Credi anche nelle scie chimiche?") 
		end

		#machiavelli
		if message.text.to_s.downcase.include?("machiavelli")
			bot.api.send_message(chat_id: message.chat.id, text: "il fine giustifica i mezzi")
		end
	
		#renzi
		if message.text.to_s.downcase.include?("renzi")
			bot.api.send_message(chat_id: message.chat.id, text: "Secondo Machiavelli, il GRANDE Machiavelli, Il principe faccia quel che occorre per vincere e conservare il potere. I mezzi saranno sempre giudicati onorevoli e lodati da ognuno, perché il volgo bada sempre alle apparenze e al risultato. E nel mondo il popolo è da per tutto. Le minoranze non contano, quando le maggioranze hanno dove appoggiarsi")
		end

		#trump
		if message.text.to_s.downcase.include?("trump")
			case Random.rand(0...2)
			when 0
				bot.api.send_message(chat_id: message.chat.id, text: "A me Trump non è che sta antipatico. A me Trump, fa PAURA. Comprendi? Il principe di Machiavelli è una persona CAPACE. E' una persona che sì, fa cattive azioni, ma per il bene del paese. Trump, innanzitutto non si sa cosa vuole fare. PUNTO. Cioè è proprio generico. Io spero che vinca ma sai perché? So proprio curioso, la curiosità è troppa, capito? A me le cose apocalittiche piacciono e Trump mi sa proprio degrado, ma proprio fine del mondo, apocallise capito? Aspetto solo i quattro cavalieri descritti dalla Bibbia")
			when 1
				bot.api.send_message(chat_id: message.chat.id, text: "Trump rispecchia la parte peggiore dell'America, quella segregazionista, fascista, razzista, maschilista... Veramente.  E' tornare 50 anni indietro proprio, comprendi?")
			end	
		end

	end
end
